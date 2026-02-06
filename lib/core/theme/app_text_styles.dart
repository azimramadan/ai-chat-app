import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Nunito';

  static const TextStyle displayMediumPrimary = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle titleLargeAppBar = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle titleSmallStatus = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );

  static const TextStyle bodyLargeBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMediumOnboarding = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnBording,
  );

  static const TextStyle bodySmallSecondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelLargeButton = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle bodyMediumChatUser = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle bodyMediumChatAi = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.textTertiary,
  );

  static const TextStyle bodySmallChatAi = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textFooter,
  );
}
