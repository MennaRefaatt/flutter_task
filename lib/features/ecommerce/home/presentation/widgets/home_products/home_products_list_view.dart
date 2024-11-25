import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/product_item_widget.dart';
import '../../../../../../core/helpers/safe_print.dart';
import '../../../../suggested_products/presentation/screen/suggested_products_screen.dart';
import '../../../../suggested_products/suggested_products_args.dart';
import '../../../domain/home_entity/home_entity.dart';

class HomeProductsListView extends StatefulWidget {
  const HomeProductsListView({
    super.key,
    required this.products,
  });
  final List<ProductEntity> products;
  @override
  State<HomeProductsListView> createState() => _HomeProductsListViewState();
}

class _HomeProductsListViewState extends State<HomeProductsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suggested For You",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SuggestedProductsScreen(
                      args: SuggestedProductsArgs(products: widget.products),
                    );
                  }));
                  safePrint(widget.products.length.toString());
                  safePrint(SuggestedProductsArgs(products: widget.products)
                      .toString());
                },
                borderRadius: BorderRadius.circular(20.r),
                child: Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    widget.products.length > 5 ? 5 : widget.products.length,
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                    price: widget.products[index].price.toString(),
                    name: widget.products[index].name,
                    image: widget.products[index].image,
                    id: widget.products[index].id,
                    inFavorites: widget.products[index].isFav,
                    oldPrice: widget.products[index].oldPrice.toString(),
                    discount: widget.products[index].discount.toString(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
