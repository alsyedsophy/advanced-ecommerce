import 'package:advanced_ecommerce/models/product.dart';
import 'package:advanced_ecommerce/views/widgets/item_product_at_home.dart';
import 'package:advanced_ecommerce/views/widgets/title_list_widget.dart';
import 'package:advanced_ecommerce/views/widgets/top_home_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopHomeImageWidget(size: size),
          Gap(37.h),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                TitleListWidget(
                  title: "Sale",
                  subtitle: "Super summer sale",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 280.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              right: 20,
                            ),
                            child: ItemProductAtHome(product: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
                TitleListWidget(
                  title: "New",
                  subtitle: "Super New Products",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 280.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              right: 20,
                            ),
                            child: ItemProductAtHome(product: e),
                          ),
                        )
                        .toList(),
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
