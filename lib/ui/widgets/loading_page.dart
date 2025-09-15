import 'package:flutter/material.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class VLoadingPage extends StatelessWidget {
  const VLoadingPage({super.key});

  Widget _loadingPage() {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(VColor.primary),
          ),
          SizedBox(
            height: 14,
          ),
          VText(
            "Please wait . . .",
            color: VColor.grey4,
            fontSize: 14,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loadingPage();
  }
}
