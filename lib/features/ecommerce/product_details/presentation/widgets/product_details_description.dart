import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../data/model/product_details_model.dart';

class ProductDetailsDescription extends StatefulWidget {
  ProductDetailsDescription({
    super.key,
    required this.productDetailsData,
    required this.productId,
    required this.isFavourite,
  });

  final ProductDetailsData productDetailsData;
  final int productId;
  late bool isFavourite;

  @override
  State<ProductDetailsDescription> createState() =>
      _ProductDetailsDescriptionState();
}

class _ProductDetailsDescriptionState extends State<ProductDetailsDescription> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primary,
                    ),
                    horizontalSpacing(5.sp),
                    Text(
                      "4.9",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w800),
                    ),
                    horizontalSpacing(5.sp),
                    widget.productDetailsData.discount != "0"
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 3.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.primary.withOpacity(0.4),
                            ),
                            child: Text(
                              "${widget.productDetailsData.discount}%",
                              style:
                                  const TextStyle(color: AppColors.greyBorder),
                            ))
                        : Container(),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isFavourite = !widget.isFavourite;
                    });
                  },
                  icon: Icon(
                    widget.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColors.primary,
                    size: 30.sp,
                  )),
            ],
          ),
          Text(
            widget.productDetailsData.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              overflow: TextOverflow.visible,
            ),
          ),
          verticalSpacing(10.h),
          Row(
            children: [
              Text(
                "\$${widget.productDetailsData.price}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    fontSize: 18.sp),
              ),
              horizontalSpacing(5.w),
              if (widget.productDetailsData.oldPrice !=
                  widget.productDetailsData.price)
                Text(
                  "\$${widget.productDetailsData.oldPrice}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.grey,
                    fontSize: 18.sp,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.greyBorder,
                  ),
                )
            ],
          ),
          verticalSpacing(10.h),
          Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          verticalSpacing(5.h),
          Text(
            isExpanded
                ? widget.productDetailsData.description
                : widget.productDetailsData.description.length > 100
                    ? '${widget.productDetailsData.description.substring(0, 100)}...'
                    : widget.productDetailsData.description,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.greyBorder,
                fontSize: 16.sp),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Show less" : "Read more",
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
