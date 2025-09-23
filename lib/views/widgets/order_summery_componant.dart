import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';

class OrderSummeryComponant extends StatelessWidget {
  const OrderSummeryComponant({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.text14w500style),
        Text('$value \$', style: AppTextStyle.categoryItemStyle),
      ],
    );
  }
}
