import 'package:advanced_ecommerce/controllers/shipping%20address/shipping_cubit.dart';
import 'package:advanced_ecommerce/utilities/routing/app_routs.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/checkout/shipping_address_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShippingAddresses extends StatefulWidget {
  const ShippingAddresses({super.key});

  @override
  State<ShippingAddresses> createState() => _ShippingAddressesState();
}

class _ShippingAddressesState extends State<ShippingAddresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping Addresses", style: AppTextStyle.text24BoldStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          child: StreamBuilder(
            stream: context.read<ShippingCubit>().getAllShipping(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return Column(
                children: snapshot.data!
                    .map(
                      (element) =>
                          ShippingAddressState(shippingAddressModel: element),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRouts.addingShippingAddress);
        },
        backgroundColor: AppColors.primaryBlackColor,
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
    );
  }
}
