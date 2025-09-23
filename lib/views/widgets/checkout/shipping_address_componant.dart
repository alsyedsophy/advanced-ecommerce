import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ShippingAddressComponant extends StatelessWidget {
  const ShippingAddressComponant({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.h,
      width: double.infinity,
      child: Card(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sayed Sophy', style: AppTextStyle.categoryItemStyle),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Change",
                      style: AppTextStyle.categoryItemStyle.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(8.h),
              Text("3 Newbridge Court", style: AppTextStyle.text14w500style),
              Text(
                "Chino Hills, CA 91709, United States",
                style: AppTextStyle.text14w500style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
