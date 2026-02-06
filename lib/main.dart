import 'package:ai_chat_app/app.dart';
import 'package:ai_chat_app/core/utils/helpers.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isFirstLaunch = await AppHelpers.isFirstLaunch();

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}
