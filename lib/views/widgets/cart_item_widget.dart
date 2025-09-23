import 'package:advanced_ecommerce/models/cart_model.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartModel});

  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          // side: BorderSide()
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
              child: Image.network(
                cartModel.imageUrl,
                width: 140.w,
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartModel.title,
                        style: AppTextStyle.categoryItemStyle,
                      ),
                      Icon(Icons.more_vert, size: 30.sp),
                    ],
                  ),
                  Gap(10.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Text("Color: ${cartModel.color}"),
                      Gap(16.w),
                      Text("Size: ${cartModel.size}"),
                    ],
                  ),
                  Gap(20.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Material(
                          shape: CircleBorder(),
                          elevation: 0.8,
                          child: CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            radius: 18.r,
                            child: Icon(Icons.add, size: 18),
                          ),
                        ),
                      ),
                      Gap(10.w),
                      Text("1"),
                      Gap(10.w),
                      InkWell(
                        onTap: () {},
                        child: Material(
                          shape: CircleBorder(),
                          elevation: 0.8,
                          child: CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            radius: 18.r,
                            child: Icon(CupertinoIcons.minus, size: 18),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${cartModel.price}\$",
                        style: AppTextStyle.categoryItemStyle,
                      ),
                      Gap(8.w),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
