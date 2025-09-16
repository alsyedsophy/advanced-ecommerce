import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';

class TitleListWidget extends StatelessWidget {
  const TitleListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });
  final String title;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.text34w700style.copyWith(
                color: AppColors.primaryBlackColor,
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                "View All",
                style: AppTextStyle.text14w500style.copyWith(
                  color: AppColors.secondryBlackColor,
                ),
              ),
            ),
          ],
        ),
        Text(subtitle, style: AppTextStyle.text14w500style),
      ],
    );
  }
}
