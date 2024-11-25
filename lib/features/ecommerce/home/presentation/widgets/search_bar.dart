import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/app_text_form_field.dart';
import '../../../../../core/theming/app_colors.dart';

class SearchBarr extends StatelessWidget {
  const SearchBarr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: GestureDetector(
              onTap: () {},
              child: AppTextFormField(
                borderRadius: BorderRadius.circular(30.r),
                backgroundColor: Colors.grey.shade100,
                isFilled: true,
                borderColor: Colors.transparent,
                hintText: "Search",
                withHint: true,
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 8.sp),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.search,
                        size: 24.sp,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
