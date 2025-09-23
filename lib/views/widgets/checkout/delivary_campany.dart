import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DelivaryCampany extends StatelessWidget {
  const DelivaryCampany({super.key, required this.image, required this.days});
  final String image;
  final String days;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 72.h,
        width: 100.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image, fit: BoxFit.cover, height: 17.h, width: 61.w),
            Gap(6.h),
            Text('$days days'),
          ],
        ),
      ),
    );
  }
}
