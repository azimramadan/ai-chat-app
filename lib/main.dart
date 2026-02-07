import 'package:ai_chat_app/app.dart';
import 'package:ai_chat_app/core/utils/helpers.dart';
import 'package:ai_chat_app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initializeDependencies();

  final bool isFirstLaunch = await AppHelpers.isFirstLaunch();

  await dotenv.load(fileName: ".env");

  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}
