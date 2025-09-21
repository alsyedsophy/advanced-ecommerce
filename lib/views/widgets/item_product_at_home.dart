import 'package:advanced_ecommerce/models/product.dart';
import 'package:advanced_ecommerce/utilities/routing/app_routs.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/favourite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ItemProductAtHome extends StatelessWidget {
  const ItemProductAtHome({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouts.productScreen, extra: product);
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  product.imageUrl,
                  height: 184,
                  width: 164,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Gap(4.w),
                  Text("(23)"),
                ],
              ),

              Text(
                product.title,
                style: AppTextStyle.text14w500style.copyWith(fontSize: 11.sp),
              ),
              Text(product.category!, style: AppTextStyle.categoryItemStyle),
              Text(
                "${product.price} \$",
                style: AppTextStyle.text14w500style.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Positioned(bottom: 70.h, right: 1.w, child: FavouriteWidget()),
          Positioned(
            top: 8.h,
            left: 9.w,
            child: Container(
              alignment: Alignment.center,
              height: 24.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(29.r),
                color: AppColors.primaryColor,
              ),
              child: Text(
                "${product.descountValue!}%",
                style: AppTextStyle.descountProductStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
