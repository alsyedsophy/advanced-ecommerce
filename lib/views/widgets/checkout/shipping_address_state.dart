import 'package:advanced_ecommerce/models/shipping_address_model.dart';
import 'package:advanced_ecommerce/utilities/routing/app_routs.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ShippingAddressState extends StatefulWidget {
  const ShippingAddressState({super.key, required this.shippingAddressModel});
  final ShippingAddressModel shippingAddressModel;

  @override
  State<ShippingAddressState> createState() => _ShippingAddressStateState();
}

class _ShippingAddressStateState extends State<ShippingAddressState> {
  late bool checkedValue = widget.shippingAddressModel.isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
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
                  Text(
                    widget.shippingAddressModel.fullname,
                    style: AppTextStyle.categoryItemStyle,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(
                        AppRouts.addingShippingAddress,
                        extra: widget.shippingAddressModel,
                      );
                    },
                    child: Text(
                      "Edit",
                      style: AppTextStyle.categoryItemStyle.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(8.h),
              Text(
                widget.shippingAddressModel.address,
                style: AppTextStyle.text14w500style,
              ),
              Text(
                widget.shippingAddressModel.country,
                style: AppTextStyle.text14w500style,
              ),
              CheckboxListTile(
                title: Text("Use as Shipping Address"),
                value: checkedValue,
                onChanged: (value) {
                  setState(() {
                    checkedValue = value!;
                  });
                },
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
