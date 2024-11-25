import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/app_entry_point.dart';
import 'core/di/di.dart';
import 'core/services/network/api_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  await init();

  runApp(const AppEntryPoint());
}
