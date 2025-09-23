
import 'package:advanced_ecommerce/controllers/product/product_cubit.dart';
import 'package:advanced_ecommerce/controllers/product/product_state.dart';
import 'package:advanced_ecommerce/models/product.dart';
import 'package:advanced_ecommerce/views/widgets/item_product_at_home.dart';
import 'package:advanced_ecommerce/views/widgets/title_list_widget.dart';
import 'package:advanced_ecommerce/views/widgets/top_home_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // تحميل البيانات عند دخول الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().loadAllProducts();
    });
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
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading || state is ProductInit) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is ProductSuccess) {
                        return StreamBuilder<List<Product>>(
                          stream: context
                              .read<ProductCubit>()
                              .getDescountProductStream(),
                          builder: (context, snapshot) {
                            final products = snapshot.data;
                            if (products == null || products.isEmpty) {
                              return Center(child: Text("No Found Products"));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,

                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 20,
                                  ),
                                  child: ItemProductAtHome(
                                    product: products[index],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      if (state is ProductError) {
                        return Center(child: Text(state.error));
                      }

                      return Center(child: Text("==========Some Thing Error"));
                    },
                  ),
                ),
                TitleListWidget(
                  title: "New",
                  subtitle: "Super New Products",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 280.h,
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading || state is ProductInit) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is ProductSuccess) {
                        return StreamBuilder<List<Product>>(
                          stream: context
                              .read<ProductCubit>()
                              .getAllProductStream(),
                          builder: (context, snapshot) {
                            final products = snapshot.data;
                            if (products == null || products.isEmpty) {
                              return Center(child: Text("No Found Products"));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,

                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 20,
                                  ),
                                  child: ItemProductAtHome(
                                    product: products[index],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      if (state is ProductError) {
                        return Center(child: Text(state.error));
                      }
                      return Center(child: Text("Some Thing Error"));
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
