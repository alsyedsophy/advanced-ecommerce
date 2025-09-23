import 'dart:developer';

import 'package:advanced_ecommerce/controllers/cart/cart_cubit.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/checkout/delivary_campany.dart';
import 'package:advanced_ecommerce/views/widgets/checkout/payment_componant.dart';
import 'package:advanced_ecommerce/views/widgets/checkout/shipping_address_componant.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:advanced_ecommerce/views/widgets/order_summery_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout", style: AppTextStyle.text24BoldStyle),
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Shipping Address", style: AppTextStyle.text24BoldStyle),
              Gap(22.h),
              ShippingAddressComponant(),
              Gap(56.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment", style: AppTextStyle.text24BoldStyle),
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
              Gap(17.h),
              PaymentComponant(),
              Gap(51.h),
              Text("Delivary Method", style: AppTextStyle.text24BoldStyle),
              Gap(21.h),
              SizedBox(
                height: 120.h,
                child: StreamBuilder(
                  stream: context.read<CartCubit>().getDelivary(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (snapshot.hasError) {
                      log(snapshot.error.toString());
                      return Center(child: Text("Error "));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final model = snapshot.data![index];
                        return DelivaryCampany(
                          image: model.imageUrl,
                          days: model.days,
                        );
                      },
                    );
                  },
                ),
              ),
              Gap(40.h),
              OrderSummeryComponant(title: 'Order:', value: 125),
              Gap(10.h),
              OrderSummeryComponant(title: 'Delivary:', value: 15),
              Gap(10.h),
              OrderSummeryComponant(title: 'Summary:', value: 140),
              Gap(24.h),
              MainButtom(title: "SUPMIT ORDER", onPressed: () {}),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
