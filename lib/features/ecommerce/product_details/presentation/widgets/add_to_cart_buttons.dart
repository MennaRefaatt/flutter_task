import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_button.dart';
import '../../product_details_args.dart';

class AddToCartButtons extends StatefulWidget {
  const AddToCartButtons({
    super.key,
    required this.args,
  });
  final ProductDetailsArgs args;

  @override
  State<AddToCartButtons> createState() => _AddToCartButtonsState();
}

class _AddToCartButtonsState extends State<AddToCartButtons> {
  late bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50.w,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  isInCart = !isInCart;
                });
              },
              backgroundColor: isInCart ? AppColors.red : Colors.white,
              child: Icon(
                isInCart
                    ? Icons.remove_shopping_cart_rounded
                    : CupertinoIcons.cart_fill,
                color: isInCart ? Colors.white : AppColors.primary,
              ),
            ),
          ),
          horizontalSpacing(15.w),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyBorder.withOpacity(0.2),
                    blurRadius: 3.r,
                    offset: const Offset(2, 6),
                  ),
                ]),
            child: AppButton(
              width: 150,
              onPressed: () {},
              text: "Buy Now",
              textStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
              backgroundColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
