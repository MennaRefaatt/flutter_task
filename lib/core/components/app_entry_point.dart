import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/ecommerce/home/presentation/screen/home_screen.dart';

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({
    super.key,
  });

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        enableScaleText: () => false,
        enableScaleWH: () => false,
        builder: (BuildContext context, Widget? child) {
          return const MaterialApp(
            title: 'task',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
