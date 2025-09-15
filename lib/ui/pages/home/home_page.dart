import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/data/models/customer.dart';
import 'package:simple_sfa_mobile/data/models/customer_tth.dart';
import 'package:simple_sfa_mobile/ui/pages/home/dialog_hadiah.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_controller.dart';
import 'package:simple_sfa_mobile/ui/widgets/button.dart';
import 'package:simple_sfa_mobile/ui/widgets/loading_page.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColor.background,
      body: Obx(
        () => controller.isLoadingObs.value
            ? const VLoadingPage()
            : SafeArea(
                child: Column(
                  children: [
                    _header(),
                    _body(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: marginMedium, vertical: marginSmall),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: VColor.primary, width: 2),
                borderRadius: BorderRadius.circular(radiusSmall),
              ),
              child: Obx(
                () => DropdownButton<Customer>(
                  value: controller.selectedCustomer.value,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: controller.customerList.map((customer) {
                    return DropdownMenuItem<Customer>(
                      value: customer,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: VColor.grey2),
                            child: const Icon(
                              Icons.home,
                              color: VColor.white,
                              size: textSizeMedium,
                            ),
                          ),
                          spaceHorizontalSmall,
                          VText(
                            customer.name ?? 'No Customer',
                            fontSize: textSizeMedium,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: controller.onSelectCustomer,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8), // optional spacing
          VButton(
            text: "Total Hadiah",
            icon: Icons.card_giftcard,
            onTap: () {
              showDialogHadiah();
            },
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: VColor.primary,
        ),
        child: Column(
          children: [
            _customerInfo(),
            Expanded(child: _totalHadiahList()),
            Container(
              color: VColor.background,
              padding: const EdgeInsets.symmetric(horizontal: marginLarge, vertical: marginSmall),
              child: Row(
                children: [
                  Expanded(child: _failureButton()),
                  spaceHorizontalSmall,
                  Expanded(child: _confirmButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customerInfo() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: marginLarge),
        padding: const EdgeInsets.symmetric(vertical: marginMedium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: VText(
                    controller.selectedCustomer.value.name ?? "Pilih Customer",
                    color: VColor.white,
                    fontSize: textSizeMedium,
                    isBold: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Expanded(
                  child: VText(
                    controller.getStatusDelivery(controller.selectedCustomerTth.value),
                    color: VColor.white,
                    fontSize: textSizeMedium,
                    align: TextAlign.end,
                    isBold: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            spaceVerticalSuperSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: textSizeSmall,
                        color: VColor.white,
                      ),
                      spaceHorizontalSuperSmall,
                      Expanded(
                        child: VText(
                          controller.selectedCustomer.value.address ?? "No address",
                          color: VColor.white,
                          fontSize: textSizeSmall,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.phone,
                        size: textSizeSmall,
                        color: VColor.white,
                      ),
                      spaceHorizontalSuperSmall,
                      VText(
                        controller.selectedCustomer.value.phoneNo ?? "No Phone",
                        color: VColor.white,
                        fontSize: textSizeSmall,
                        align: TextAlign.end,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalHadiahList() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: VColor.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusMax),
          topRight: Radius.circular(radiusMax),
        ),
      ),
      child: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: marginMedium, vertical: marginMedium),
          itemCount: controller.customerTthList.length,
          separatorBuilder: (context, index) => spaceVerticalSmall,
          itemBuilder: (context, index) {
            final tth = controller.customerTthList[index];
            return _totalHadiahCard(tth);
          },
        ),
      ),
    );
  }

  Widget _totalHadiahCard(CustomerTth tth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: marginMedium, vertical: 7),
      decoration: const BoxDecoration(
        color: VColor.accent,
        borderRadius: BorderRadius.all(Radius.circular(radiusMax)),
      ),
      child: Row(
        children: [
          Container(
            width: 23,
            height: 23,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("${imagePath}gift_box.png")),
            ),
          ),
          spaceHorizontalSmall,
          VText(
            tth.tTOTTPNo,
            fontSize: textSizeMedium,
            color: VColor.white,
          ),
        ],
      ),
    );
  }

  Widget _confirmButton() {
    return Obx(() => controller.isButtonShow()
        ? SizedBox(
            width: double.infinity,
            child: VButton(
              text: "Terima",
              onTap: controller.onClickConfirmDelivery,
            ),
          )
        : const SizedBox.shrink());
  }

  Widget _failureButton() {
    return Obx(() => controller.isButtonShow()
        ? SizedBox(
            width: double.infinity,
            child: VButton(
              text: "Tolak",
              borderColor: VColor.secondary,
              buttonColor: VColor.white,
              textColor: VColor.secondary,
              onTap: controller.onClickFailureDelivery,
            ),
          )
        : const SizedBox.shrink());
  }
}
