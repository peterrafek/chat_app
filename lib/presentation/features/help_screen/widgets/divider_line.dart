import 'package:flutter/cupertino.dart';

import '../../../core/constants/app_colors.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppColors.salmon,
    );
  }
}
