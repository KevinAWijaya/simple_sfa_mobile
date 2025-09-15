import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/base_controller.dart';
import 'package:simple_sfa_mobile/core/constants/status_delivery.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/core/utils.dart';
import 'package:simple_sfa_mobile/data/models/customer.dart';
import 'package:simple_sfa_mobile/data/models/customer_tth.dart';
import 'package:simple_sfa_mobile/data/models/request/bulk_update_received.dart';
import 'package:simple_sfa_mobile/data/repositories/customer_repo.dart';
import 'package:simple_sfa_mobile/ui/widgets/dialogs/confirmation.dart';
import 'package:simple_sfa_mobile/ui/widgets/dialogs/rejection.dart';
import 'package:simple_sfa_mobile/ui/widgets/loading.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class HomeController extends BaseController {
  final CustomerRepo customerRepo;
  HomeController(this.customerRepo);

  var customerList = <Customer>[].obs;
  var selectedCustomer = Customer().obs;

  var customerTthList = <CustomerTth>[].obs;
  var selectedCustomerTth = CustomerTth().obs;

  @override
  Future<void> onInit() async {
    startLoading();
    await getCustomerList();
    await getTthDetail();
    stopLoading();
    super.onInit();
  }

  Future<void> getCustomerList() async {
    try {
      var result = await customerRepo.fetchCustomerList();
      if (result.isNotEmpty) {
        customerList.clear();
        customerList.add(Customer(name: "Pilih Customer"));
        customerList.addAll(result);
        selectedCustomer.value = customerList.first;
      }
      log("message first : ${customerList.first.toJson()}");
    } catch (e) {
      log("message : $e");
    }
  }

  Future<void> onSelectCustomer(Customer? val) async {
    if (val != null) {
      LoadingHelper.showLoading();
      selectedCustomer.value = val;
      await getTthDetail();
      LoadingHelper.hideLoading();
    }
  }

  Future<void> getTthDetail() async {
    try {
      if (selectedCustomer.value.custID != null) {
        var result = await customerRepo.fetchCustomerTotalHadiahByCustomerId(selectedCustomer.value.custID!);
        if (result.isNotEmpty) {
          customerTthList.clear();
          customerTthList.addAll(result);
          selectedCustomerTth.value = customerTthList.first;
        }
      } else {
        var result = await customerRepo.fetchCustomerTotalHadiah();
        if (result.isNotEmpty) {
          customerTthList.clear();
          customerTthList.addAll(result);
          selectedCustomerTth.value = customerTthList.first;
        }
      }
    } catch (e) {
      log("message getTthDetail : $e");
    }
  }

  String getStatusDelivery(CustomerTth customerTth) {
    String receivedDate = Utils.formatDate(customerTth.receivedDate);
    if (selectedCustomer.value.custID == null) {
      return StatusDelivery.notDelivered.label;
    }
    if (customerTth.received == 1 && receivedDate != "-") {
      return StatusDelivery.acceptedDelivered.label;
    } else if (customerTth.received == 0 && receivedDate != "-" && customerTth.failedReason != "") {
      return StatusDelivery.rejectedDelivery.label;
    } else {
      return StatusDelivery.notDelivered.label;
    }
  }

  Future<Map<String, Map<String, dynamic>>> getTotalHadiah() async {
    try {
      var result = await customerRepo.fetchTotalHadiah();
      return result;
    } catch (e) {
      log("message : $e");
      return {};
    }
  }

  bool isButtonShow() {
    if (selectedCustomer.value.custID != null) {
      if (selectedCustomerTth.value.received == 1) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Future<void> onClickConfirmDelivery() async {
    Get.dialog(
      CustomConfirmDialog(
        title: "Sudah Terima TTH",
        message: "Yakin ingin menyimpan sudah terima TTH?",
        negativeText: "TIDAK",
        positiveText: "YA, SUDAH DITERIMA",
        onPressedCancel: () {
          Get.back();
        },
        onPressedOk: () {
          onConfirmationDelivery(1);
        },
      ),
    );
  }

  Future<void> onConfirmationDelivery(int received, {String failedReason = ""}) async {
    Get.back();
    LoadingHelper.showLoading();
    try {
      if (selectedCustomer.value.custID != null) {
        final formatedDate = Utils.formatDate(DateTime.now().toString(), patern: "yyyy-MM-dd HH:mm:ss");
        RequestBulkUpdate requestBody = RequestBulkUpdate(
          failedReason: received == 1 ? "" : failedReason,
          received: received,
          receivedDate: formatedDate,
        );
        final result = await customerRepo.updateAllReceived(selectedCustomer.value.custID!, requestBody);
        String title = "";
        if ((result.updatedRows ?? 0) > 0) {
          title = "Success";
          await getTthDetail();
        } else {
          title = "Failed";
        }

        LoadingHelper.hideLoading();
        Get.snackbar(
          title,
          result.message ?? "Unknown Failed Occured",
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          backgroundColor: VColor.primary,
          colorText: VColor.white,
          duration: const Duration(seconds: 2),
          mainButton: TextButton(
            onPressed: () => Get.closeCurrentSnackbar(),
            child: const VText(
              "Tutup",
              color: VColor.white,
            ),
          ),
        );
      }
    } catch (e) {
      log("error onConfirmationDelivery: $e");
    }
  }

  Future<void> onClickFailureDelivery() async {
    Get.dialog(
      CustomRejectDialog(
        onPressedCancel: () {
          Get.back();
        },
        onPressedOk: (String reason) {
          Get.back();
          onConfirmationDelivery(0, failedReason: reason);
        },
      ),
    );
  }
}
