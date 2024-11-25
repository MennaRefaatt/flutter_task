import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/ecommerce/product_details/presentation/manager/product_details_bloc.dart';
import '../../../../../core/components/app_bar.dart';
import '../../../../../core/components/app_network_image.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/helpers/safe_print.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../data/model/product_details_model.dart';
import '../../product_details_args.dart';
import '../widgets/add_to_cart_buttons.dart';
import '../widgets/product_details_description.dart';
import '../widgets/product_details_shimmer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.args});
  final ProductDetailsArgs args;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final cubit = ProductDetailsBloc(pDetailsRepoImpl: sl());
  late final ProductDetailsData productDetailsData;

  @override
  void initState() {
    super.initState();
    // Fetch data on widget initialization
    cubit.add(FetchProductDetailsEvent(productId: widget.args.id));

    // Simulate loading delay (optional)
    Future.delayed(const Duration(seconds: 2), () {
      // No further action needed, data is already being fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    safePrint(widget.args.id);
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Column(
          children: [
            const DefaultAppBar(
              text: "Product Details",
              cartIcon: false,
              backArrow: true,
            ),
            Expanded(
              child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                builder: (context, state) {
                  if (state is ProductDetailsLoading) {
                    return const ProductDetailsShimmer();
                  } else if (state is ProductDetailsError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is ProductDetailsSuccess) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ListView(
                          children: [
                            ImageSlideshow(
                              indicatorColor: AppColors.primary,
                              indicatorBackgroundColor: AppColors.backGround,
                              initialPage: 0,
                              indicatorRadius: 5.sp,
                              onPageChanged: (value) {
                                debugPrint('Page changed: $value');
                              },
                              autoPlayInterval: 3000,
                              isLoop: false,
                              children: state.productDetailsModel.data!.images
                                  .map(
                                    (e) => AppNetworkImage(
                                  imageUrl: e,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(0.r),
                                ),
                              )
                                  .toList(),
                            ),
                            ProductDetailsDescription(
                              productDetailsData: state.productDetailsModel.data!,
                              productId: widget.args.id,
                              isFavourite: state.productDetailsModel.data!.inFavorites,
                            ),
                            verticalSpacing(70.h),
                          ],
                        ),
                        AddToCartButtons(
                          args: widget.args,
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}