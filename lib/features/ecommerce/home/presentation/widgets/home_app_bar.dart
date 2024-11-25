import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/shared_pref.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/app_svg.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppImage(
            path: "app_icon2.png",
            width: 40.w,
            height: 40.h,
            fit: BoxFit.fill,
          ),
          Expanded(
              child: Text(
            "EShop",
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          )),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30.r),
            child: CircleAvatar(
              backgroundColor:
                  SharedPref.getBoolean(key: MySharedKeys.isDarkMode)
                      ? AppColors.primaryLight.withOpacity(0.2)
                      : AppColors.primary.withOpacity(0.1),
              child: AppSvg(
                path: "shopping-cart",
                width: 20.w,
                height: 20.h,
                color: AppColors.primary,
              ),
            ),
          ),
          horizontalSpacing(10.sp),
          InkWell(
              borderRadius: BorderRadius.circular(30.r),
              onTap: () {},
              child: CircleAvatar(
                  backgroundColor:
                      SharedPref.getBoolean(key: MySharedKeys.isDarkMode)
                          ? AppColors.primaryLight.withOpacity(0.2)
                          : AppColors.primary.withOpacity(0.1),
                  child: const Icon(
                    CupertinoIcons.chat_bubble_2,
                    color: AppColors.primary,
                  ))),
          horizontalSpacing(10.sp),
          CircleAvatar(
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dark_mode,
                  color: AppColors.primary,
                )),
          ),
        ],
      ),
    );
  }
}
