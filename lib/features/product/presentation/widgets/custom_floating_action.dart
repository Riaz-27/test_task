import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_palette.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 40),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppPalette.accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: AppPalette.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(left: 25, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppPalette.greyColor,
          ),
          child: Icon(
            Icons.shopping_cart_checkout_rounded,
            color: AppPalette.whiteColor,
            size: 26,
          ),
        ),
      ],
    );
  }
}
