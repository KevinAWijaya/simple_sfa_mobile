import 'package:flutter/foundation.dart';
import 'package:simple_sfa_mobile/core/services/api_client.dart';
import 'package:simple_sfa_mobile/core/services/api_url.dart';
import 'package:simple_sfa_mobile/data/models/customer.dart';
import 'package:simple_sfa_mobile/data/models/customer_tth.dart';
import 'package:simple_sfa_mobile/data/models/customer_tth_detail.dart';
import 'package:simple_sfa_mobile/data/models/mobile_config.dart';
import 'package:simple_sfa_mobile/data/models/request/bulk_update_received.dart';
import 'package:simple_sfa_mobile/data/models/update_message.dart';

class CustomerRepo {
  final ApiClient _apiClient;

  CustomerRepo(this._apiClient);

  /// fetch list customer
  Future<List<Customer>> fetchCustomerList() async {
    try {
      final res = await _apiClient.get(
        url: ApiUrl.customer,
        params: {},
      );

      if (res != null && res.statusCode == 200) {
        final List<dynamic> data = res.data;
        return data.map((e) => Customer.fromJson(e)).toList();
      } else {
        debugPrint('Error fetching customers: empty');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching customers: $e');
      return [];
    }
  }

  /// fetch list customer total hadiah
  Future<List<CustomerTth>> fetchCustomerTotalHadiah() async {
    try {
      final res = await _apiClient.get(
        url: ApiUrl.customerTth,
        params: {},
      );

      if (res != null && res.statusCode == 200) {
        final List<dynamic> data = res.data;
        return data.map((e) => CustomerTth.fromJson(e)).toList();
      } else {
        debugPrint('Error fetching CustomerTth: empty');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching CustomerTth: $e');
      return [];
    }
  }

  Future<List<CustomerTth>> fetchCustomerTotalHadiahByCustomerId(String customerId) async {
    try {
      var customerTth = await fetchCustomerTotalHadiah();
      if (customerTth.isNotEmpty) {
        return customerTth.where((element) => element.custID == customerId).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /// fetch list customer total hadiah detail
  Future<List<CustomerTthDetail>> fetchCustomerTthDetail() async {
    try {
      final res = await _apiClient.get(
        url: ApiUrl.customerTthDetail,
        params: {},
      );

      if (res != null && res.statusCode == 200) {
        final List<dynamic> data = res.data;
        return data.map((e) => CustomerTthDetail.fromJson(e)).toList();
      } else {
        debugPrint('Error fetching CustomerTthDetail: empty');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching CustomerTthDetail: $e');
      return [];
    }
  }

  /// fetch config
  Future<List<MobileConfig>> fetchMobileConfig() async {
    try {
      final res = await _apiClient.get(
        url: ApiUrl.mobileConfig,
        params: {},
      );

      if (res != null && res.statusCode == 200) {
        final List<dynamic> data = res.data;
        return data.map((e) => MobileConfig.fromJson(e)).toList();
      } else {
        debugPrint('Error fetching MobileConfig: empty');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching MobileConfig: $e');
      return [];
    }
  }

  Future<Map<String, Map<String, dynamic>>> fetchTotalHadiah() async {
    try {
      var mobileConfig = await fetchMobileConfig();
      if (mobileConfig.isEmpty) return {};

      // ambil config
      List<String> values = mobileConfig.first.value?.split("|") ?? [];
      if (values.isEmpty) return {};

      // ambil tth detail
      List<CustomerTthDetail> details = await fetchCustomerTthDetail();
      if (details.isEmpty) return {};

      // calculation
      Map<String, Map<String, dynamic>> totalByJenis = {};
      for (var jenis in values) {
        // filter detail sesuai jenis
        final filtered = details.where((d) => d.jenis == jenis).toList();

        if (filtered.isNotEmpty) {
          // jumlahkan qty
          int totalQty = filtered.fold(0, (sum, d) => sum + (d.qty ?? 0));

          // ambil unit dari detail pertama (asumsi semua unit sama untuk jenis yang sama)
          String unit = filtered.first.unit ?? '';

          totalByJenis[jenis] = {
            'qty': totalQty,
            'unit': unit,
          };
        }
      }

      return totalByJenis;
    } catch (e) {
      debugPrint('Error fetching MobileConfig or CustomerTthDetail: $e');
      return {};
    }
  }

  Future<UpdateMessage> updateAllReceived(String customerId, RequestBulkUpdate body) async {
    try {
      final res = await _apiClient.post(
        url: "${ApiUrl.updateBuildreceived}/$customerId",
        body: body.toJson(),
      );
      if (res?.statusCode == 200) {
        return UpdateMessage.fromJson(res?.data);
      }
      return UpdateMessage(updatedRows: 0, message: "Data tidak berhasil diupdate");
    } catch (e) {
      debugPrint("Error updateAllReceived : $e");
      return UpdateMessage(updatedRows: 0, message: "Unknown Error Occured");
    }
  }
}
