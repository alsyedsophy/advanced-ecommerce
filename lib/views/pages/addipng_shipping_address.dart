import 'package:advanced_ecommerce/controllers/shipping%20address/shipping_cubit.dart';
import 'package:advanced_ecommerce/controllers/shipping%20address/shipping_state.dart';
import 'package:advanced_ecommerce/models/shipping_address_model.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddipngShippingAddress extends StatefulWidget {
  const AddipngShippingAddress({super.key, this.shippingAddressModel});

  final ShippingAddressModel? shippingAddressModel;

  @override
  State<AddipngShippingAddress> createState() => _AddipngShippingAddressState();
}

class _AddipngShippingAddressState extends State<AddipngShippingAddress> {
  final _fallnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      if (widget.shippingAddressModel != null) {
        final updateModel = widget.shippingAddressModel!.copyWith(
          fullname: _fallnameController.text.trim(),
          address: _addressController.text.trim(),
          city: _cityController.text.trim(),
          stateProvince: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
          country: _countryController.text.trim(),
        );
        await context.read<ShippingCubit>().addShipping(updateModel);
      } else {
        final ShippingAddressModel shippingModel = ShippingAddressModel(
          id: DateTime.now().toIso8601String(),
          fullname: _fallnameController.text.trim(),
          address: _addressController.text.trim(),
          city: _cityController.text.trim(),
          stateProvince: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
          country: _countryController.text.trim(),
        );
        await context.read<ShippingCubit>().addShipping(shippingModel);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.shippingAddressModel != null) {
      _fallnameController.text = widget.shippingAddressModel!.fullname;
      _addressController.text = widget.shippingAddressModel!.address;
      _cityController.text = widget.shippingAddressModel!.city;
      _stateController.text = widget.shippingAddressModel!.stateProvince;
      _zipCodeController.text = widget.shippingAddressModel!.zipCode;
      _countryController.text = widget.shippingAddressModel!.country;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fallnameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.shippingAddressModel != null
              ? "Editing Shipping Address"
              : "Adding Shipping Address",
          style: AppTextStyle.text24BoldStyle,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Gap(32.h),
              CustomTextField(
                hinitText: "Fullname",
                obsecureText: false,
                controller: _fallnameController,
              ),
              Gap(16.h),
              CustomTextField(
                hinitText: "Address",
                obsecureText: false,
                controller: _addressController,
              ),
              Gap(16.h),
              CustomTextField(
                hinitText: "City",
                obsecureText: false,
                controller: _cityController,
              ),
              Gap(16.h),
              CustomTextField(
                hinitText: "State/Province",
                obsecureText: false,
                controller: _stateController,
              ),
              Gap(16.h),
              CustomTextField(
                hinitText: "Zip Code",
                obsecureText: false,
                controller: _zipCodeController,
              ),
              Gap(16.h),
              CustomTextField(
                hinitText: "Country",
                obsecureText: false,
                controller: _countryController,
              ),
              Gap(32.h),
              BlocListener<ShippingCubit, ShippingState>(
                listener: (context, state) {
                  if (state is ShippingSuccess) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state is ShippingError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: MainButtom(
                  title: "Save Address",
                  onPressed: () => _saveAddress(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
