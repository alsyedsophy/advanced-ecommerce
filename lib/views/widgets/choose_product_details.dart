import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseProductDetails extends StatefulWidget {
  const ChooseProductDetails({
    super.key,
    required this.title,
    required this.choise,
    required this.onSelected,
  });
  final String title;
  final List<String> choise;
  final ValueChanged<String> onSelected;

  @override
  State<ChooseProductDetails> createState() => _ChooseProductDetailsState();
}

class _ChooseProductDetailsState extends State<ChooseProductDetails> {
  String? selectedChoise; // لتخزين الحجم المحدد

  void _showSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 400.h,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(26.h),
              Text(
                "Select ${widget.title}",
                style: AppTextStyle.categoryItemStyle.copyWith(fontSize: 18.sp),
              ),
              Gap(32.h),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3.2,
                  ),
                  itemCount: widget.choise.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, widget.choise[index]);
                      },
                      child: Container(
                        height: 40.h,
                        width: 138.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            width: 0.4.sp,
                            color: AppColors.greyColor,
                          ),
                          color: selectedChoise == widget.choise[index]
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                        child: Text(
                          widget.choise[index],
                          style: AppTextStyle.text14w500style.copyWith(
                            color: AppColors.secondryBlackColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedChoise = value;
        });
        widget.onSelected(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showSelector(),
      child: Container(
        height: 40.h,
        width: 138.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 0.4.sp, color: AppColors.greyColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              selectedChoise ?? widget.title,
              style: AppTextStyle.text14w500style.copyWith(
                color: AppColors.secondryBlackColor,
              ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
