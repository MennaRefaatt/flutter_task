import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/ecommerce/product_details/presentation/screens/product_details_screen.dart';
import '../../features/ecommerce/product_details/product_details_args.dart';
import '../helpers/safe_print.dart';
import '../helpers/shared_pref.dart';
import '../helpers/shared_pref_keys.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import 'app_network_image.dart';

class ProductItemWidget extends StatefulWidget {
  ProductItemWidget({
    super.key,
    required this.price,
    required this.name,
    required this.image,
    required this.id,
    required this.inFavorites,
    required this.oldPrice,
    required this.discount,
    this.isFavScreen = false,
  });
  final String price;
  final String name;
  final String image;
  final int id;
  late bool inFavorites;
  final String oldPrice;
  final String discount;
  bool isFavScreen;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    args: ProductDetailsArgs(id: widget.id))));
        safePrint(widget.id);
      },
      child: Container(
        width: 170.w,
        margin: EdgeInsets.all(10.sp),
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          color: SharedPref.getBoolean(key: MySharedKeys.isDarkMode)
              ? AppColors.primaryLight.withOpacity(0.3)
              : AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                Flexible(
                  child: AppNetworkImage(
                    imageUrl: widget.image,
                    width: 150.w,
                    height: 100.h,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                verticalSpacing(10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primary,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w800),
                    ),
                    widget.discount != "" && widget.discount != "0"
                        ? Container(
                            margin: EdgeInsets.all(8.sp),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 3.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.primary.withOpacity(0.4),
                            ),
                            child: Text(
                              "${widget.discount}%",
                              style:
                                  const TextStyle(color: AppColors.greyBorder),
                            ),
                          )
                        : Container()
                  ],
                ),
                verticalSpacing(10.h),
                Text(
                  widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: SharedPref.getBoolean(key: MySharedKeys.isDarkMode)
                          ? Colors.white
                          : AppColors.black,
                      fontSize: 18.sp),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.price}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          fontSize: 18.sp),
                    ),
                    horizontalSpacing(5.w),
                    if (widget.oldPrice != widget.price)
                      Text(
                        "\$${widget.oldPrice}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.grey,
                          fontSize: 12.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(1.sp),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.inFavorites = !widget.inFavorites;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: widget.inFavorites
                        ? AppColors.primary
                        : AppColors.greyBorder,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
