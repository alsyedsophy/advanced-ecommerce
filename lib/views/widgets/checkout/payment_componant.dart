import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentComponant extends StatelessWidget {
  const PaymentComponant({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 48.h,
          width: 72.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.whiteColor,
          ),
          child: Image.network(
            height: 30.h,
            width: 40.w,
            'https://img.favpng.com/8/0/13/credit-card-payment-mastercard-logo-png-favpng-yf3VzpZPY52MgZ9akdh0P1CtJ.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Gap(17.w),
        Text('**** **** **** 3456', style: AppTextStyle.categoryItemStyle),
      ],
    );
  }
}
