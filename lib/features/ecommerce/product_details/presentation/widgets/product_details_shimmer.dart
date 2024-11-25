import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Shimmer.fromColors(
        baseColor: AppColors.lightGrey,
        highlightColor: Colors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  color: AppColors.lightGrey,
                ),
                verticalSpacing(10.h),
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 20.sp,
                    color: AppColors.lightGrey,
                  ),
                ),
                verticalSpacing(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.primary,
                        ),
                        horizontalSpacing(5.sp),
                        Shimmer.fromColors(
                          baseColor: AppColors.lightGrey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 15.sp,
                            width: 40.sp,
                            color: AppColors.lightGrey,
                          ),
                        ),
                        horizontalSpacing(5.sp),
                        Shimmer.fromColors(
                          baseColor: AppColors.lightGrey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 15.sp,
                            width: 40.sp,
                            color: AppColors.lightGrey,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.primary,
                      size: 30.sp,
                    ),
                  ],
                ),
                verticalSpacing(10.h),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 20.sp,
                        width: 80.sp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    horizontalSpacing(5.w),
                    Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 20.sp,
                        width: 80.sp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
                verticalSpacing(10.h),
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 20.sp,
                    width: 120.sp,
                    color: AppColors.lightGrey,
                  ),
                ),
                verticalSpacing(5.h),
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 16.sp,
                    color: AppColors.lightGrey,
                    margin: EdgeInsets.only(right: 15.sp),
                  ),
                ),
                verticalSpacing(5.h),
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 16.sp,
                    width: 80.sp,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
