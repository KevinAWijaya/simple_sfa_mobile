import 'package:flutter/material.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/constants/failed_reason.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/widgets/button.dart';
import 'package:simple_sfa_mobile/ui/widgets/dialogs/x_popup.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class CustomRejectDialog extends StatefulWidget {
  final Function(String reason)? onPressedOk;
  final VoidCallback? onPressedCancel;

  const CustomRejectDialog({
    Key? key,
    required this.onPressedOk,
    required this.onPressedCancel,
  }) : super(key: key);

  @override
  State<CustomRejectDialog> createState() => _CustomRejectDialogState();
}

class _CustomRejectDialogState extends State<CustomRejectDialog> {
  String? selectedReason = FailedReason.valuesList.first;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: VColor.background,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Gagal Terima TTH",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            spaceVerticalLarge,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: VColor.primary, width: 2),
                borderRadius: BorderRadius.circular(radiusSmall),
              ),
              child: DropdownButton<String>(
                value: selectedReason,
                isExpanded: true,
                underline: const SizedBox(), // remove default underline
                items: FailedReason.valuesList.map((reason) {
                  final isSelected = reason == selectedReason;
                  return DropdownMenuItem<String>(
                    value: reason,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? VColor.red : VColor.green, // 🔴 vs 🟢
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            color: VColor.white,
                            size: textSizeMedium,
                          ),
                        ),
                        spaceHorizontalSmall,
                        VText(
                          reason,
                          fontSize: textSizeMedium,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedReason = val;
                  });
                },
              ),
            ),
            spaceVerticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VButton(
                  text: "BATAL",
                  onTap: widget.onPressedCancel,
                  textColor: VColor.primary,
                  buttonColor: VColor.white,
                  borderColor: VColor.primary,
                  borderWitdh: 5,
                  icon: Icons.cancel,
                  iconColor: VColor.primary,
                  iconSize: 20,
                ),
                VButton(
                  text: "SIMPAN",
                  onTap: () {
                    if (selectedReason != null) {
                      if (selectedReason != FailedReason.pilihAlasan.label) {
                        widget.onPressedOk?.call(selectedReason!);
                      } else {
                        XPopup().alertText("Oops", "Pilih alasan terlebih dahulu");
                      }
                    }
                  },
                  textColor: VColor.white,
                  buttonColor: VColor.primary,
                  icon: Icons.check_circle_outline,
                  iconColor: VColor.white,
                  iconSize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
