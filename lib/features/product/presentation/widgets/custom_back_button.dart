import 'package:flutter/cupertino.dart';
import 'package:test_task/core/theme/app_palette.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      margin: EdgeInsets.only(top: 60, right: 16, left: 16),
      decoration: BoxDecoration(
        color: AppPalette.greyColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.back,
          size: 25,
          color: AppPalette.whiteColor,
        ),
      ),
    );
  }
}
