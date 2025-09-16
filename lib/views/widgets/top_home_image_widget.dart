import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHomeImageWidget extends StatelessWidget {
  const TopHomeImageWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          height: size.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
          "https://t3.ftcdn.net/jpg/03/34/79/68/360_F_334796865_VVTjg49nbLgQPG6rgKDjVqSb5XUhBVsW.jpg",
        ),
        Opacity(
          opacity: 0.3,
          child: Container(
            height: size.height * 0.3,
            width: double.infinity,
            color: Colors.black,
          ),
        ),

        Positioned(
          bottom: 26.h,
          left: 16.w,
          child: Text("Street clothes", style: AppTextStyle.text34w700style),
        ),
      ],
    );
  }
}
