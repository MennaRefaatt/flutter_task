import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/app_bottom_nav_bar.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/helpers/spacing.dart';
import '../manager/home_bloc.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_carousel_slider/slider_bloc_builder.dart';
import '../widgets/home_products/home_products_bloc_builder.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBloc(sl());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc..add(FetchHomeData()),
      child: Scaffold(
        bottomNavigationBar: const AppBottomNavBar(index: 0),
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
            child: Column(
              children: [
                verticalSpacing(20.h),
                const HomeAppbar(),
                const SearchBarr(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(children: [
                    verticalSpacing(20.h),
                    const SliderBlocBuilder(),
                    const HomeProductsBlocBuilder(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
