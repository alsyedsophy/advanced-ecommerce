import 'package:advanced_ecommerce/controllers/cart/cart_cubit.dart';
import 'package:advanced_ecommerce/models/cart_model.dart';
import 'package:advanced_ecommerce/models/product.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/choose_product_details.dart';
import 'package:advanced_ecommerce/views/widgets/favourite_widget.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedSize;
  String? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Stack(
        children: [
          Container(height: double.infinity, width: double.infinity),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    widget.product.imageUrl,
                    height: 413.h,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChooseProductDetails(
                        title: "Size",
                        choise: ['XS', 'S', 'M', 'XM', 'L', 'XL', 'XXL'],
                        onSelected: (value) => setState(() {
                          selectedSize = value;
                        }),
                      ),
                      ChooseProductDetails(
                        title: "Color",
                        choise: ['red', 'blue', 'black', 'orange'],
                        onSelected: (value) => setState(() {
                          selectedColor = value;
                        }),
                      ),
                      FavouriteWidget(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("H&M", style: AppTextStyle.text24BoldStyle),
                            Text(
                              "${widget.product.price}\$",
                              style: AppTextStyle.text24BoldStyle,
                            ),
                          ],
                        ),
                        Text(
                          widget.product.title,
                          style: AppTextStyle.text14w500style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18.sp),
                            Gap(4.w),
                            Text(
                              widget.product.rate.toString(),
                              style: AppTextStyle.text14w500style,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // spacing
                  Gap(150.h),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 117.h,
                  width: 375.w,
                  color: AppColors.whiteColor,
                ),
                Positioned(
                  right: 16.w,
                  left: 16.w,
                  child: MainButtom(
                    title: "Add Cart",
                    onPressed: () {
                      final CartModel cartModel = CartModel(
                        id: widget.product.id,
                        title: widget.product.title,
                        price: widget.product.price,
                        imageUrl: widget.product.imageUrl,
                        descountValue: widget.product.descountValue,
                        category: widget.product.category,
                        size: selectedSize ?? '',
                        color: selectedColor ?? '',
                      );
                      context.read<CartCubit>().addToCart(cartModel);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
