import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_controller.dart';
import 'package:simple_sfa_mobile/ui/widgets/loading.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

Future<void> showDialogHadiah() async {
  LoadingHelper.showLoading();
  var controller = Get.find<HomeController>();
  Map<String, Map<String, dynamic>> hadiahList = await controller.getTotalHadiah();

  final hadiahEntries = hadiahList.entries.toList();

  int totalAll = hadiahEntries.fold(0, (sum, entry) {
    return sum + (entry.value['qty'] as int? ?? 0);
  });

  LoadingHelper.hideLoading();

  Get.dialog(
    Dialog(
      backgroundColor: VColor.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: marginExtraLarge, vertical: marginMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min, // mengikuti ukuran child
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("${imagePath}gift_box.png")),
                  ),
                ),
                spaceHorizontalSmall,
                const Expanded(
                  child: VText(
                    "Total Hadiah",
                    fontSize: textSizeMedium,
                    color: VColor.black,
                  ),
                ),
                spaceHorizontalSmall,
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(marginSmall),
                    decoration: const BoxDecoration(
                      color: VColor.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: VColor.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: VColor.yellow,
              thickness: 2,
              height: marginLarge,
            ),
            _listHadiah(hadiahEntries),
            const Divider(
              color: VColor.yellow,
              thickness: 2,
              height: marginLarge,
            ),
            _hadiahCard(MapEntry(
              "",
              {'qty': totalAll.toString(), 'unit': 'Unit'}, // Map<String, dynamic> di value
            ))
          ],
        ),
      ),
    ),
  );
}

Widget _listHadiah(List<MapEntry<String, Map<String, dynamic>>> hadiahEntries) {
  return ListView.separated(
    shrinkWrap: true, // wajib supaya ListView wrap content
    physics: const NeverScrollableScrollPhysics(), // agar dialog tidak scroll sendiri
    itemCount: hadiahEntries.length,
    separatorBuilder: (context, index) => const Divider(
      color: VColor.grey1,
      height: marginMedium,
    ),
    itemBuilder: (context, index) {
      final entry = hadiahEntries[index];
      return _hadiahCard(entry);
    },
  );
}

Widget _hadiahCard(MapEntry<String, Map<String, dynamic>> entry) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Visibility(
                  visible: entry.key != "",
                  child: Container(
                    padding: const EdgeInsets.all(marginSuperSmall),
                    decoration: const BoxDecoration(
                      color: VColor.secondary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(radiusSmall),
                      ),
                    ),
                    child: const Icon(
                      Icons.card_giftcard,
                      size: 15,
                      color: VColor.white,
                    ),
                  ),
                ),
                spaceHorizontalSmall,
                VText(
                  entry.key,
                  fontSize: textSizeMedium,
                  color: VColor.black,
                ),
              ],
            ),
            VText(
              entry.value['qty'].toString(),
              fontSize: textSizeMedium,
              color: VColor.black,
            ),
          ],
        ),
      ),
      spaceHorizontalSmall,
      Expanded(
        flex: 1,
        child: VText(
          entry.value['unit'].toString(),
          fontSize: textSizeMedium,
          color: VColor.black,
        ),
      ),
    ],
  );
}
