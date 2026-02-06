import 'package:ai_chat_app/app.dart';
import 'package:ai_chat_app/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isFirstLaunch = await AppHelpers.isFirstLaunch();
  await dotenv.load(fileName: ".env");

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}
