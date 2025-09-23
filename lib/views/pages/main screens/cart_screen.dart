import 'dart:developer';

import 'package:advanced_ecommerce/controllers/cart/cart_cubit.dart';
import 'package:advanced_ecommerce/utilities/routing/app_routs.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/cart_item_widget.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:advanced_ecommerce/views/widgets/order_summery_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalAmount = 0;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final myProducts = await context.watch<CartCubit>().getCartItem().first;
    myProducts.forEach((element) {
      setState(() {
        totalAmount += element.price as int;
        log(totalAmount.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.search, size: 24),
              ),
              Gap(20.h),
              Text(
                "My Bag",
                style: AppTextStyle.text34w700style.copyWith(
                  color: AppColors.primaryBlackColor,
                ),
              ),
              StreamBuilder(
                stream: context.read<CartCubit>().getCartItem(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    final cartIems = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartIems!.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(cartModel: cartIems[index]);
                      },
                    );
                  } else {
                    return Center(child: Text("Error"));
                  }
                },
              ),

              Gap(32.h),
              OrderSummeryComponant(title: "Total Amount", value: totalAmount),
              Gap(32.h),
              MainButtom(
                title: 'Checkout',
                onPressed: () {
                  context.pushNamed(AppRouts.chackoutScreen);
                },
              ),
              Gap(32.h),
            ],
          ),
        ),
      ),
    );
  }
}
