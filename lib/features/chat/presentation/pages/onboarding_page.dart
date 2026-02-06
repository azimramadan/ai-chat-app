import 'package:ai_chat_app/core/constants/app_assets.dart';
import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:ai_chat_app/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  Future<void> _handleContinuePressed() async {
    await AppHelpers.setFirstLaunchCompleted();

    if (!mounted) return;

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _OnboardingContent());
  }
}

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 80),
        _TitleSection(),
        SizedBox(height: 14),
        _DescriptionSection(),
        Spacer(flex: 2),
        _IllustrationSection(),
        Spacer(flex: 3),
        _ContinueButton(),
        SizedBox(height: 30),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Text(
      'You AI Assistant',
      style: AppTextStyles.displayMediumPrimary,
      textAlign: TextAlign.center,
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Using this software, you can ask you\n'
      'questions and receive articles using\n'
      'artificial intelligence assistant',
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyMediumOnboarding,
    );
  }
}

class _IllustrationSection extends StatelessWidget {
  const _IllustrationSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Image.asset(AppAssets.onboarding),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          final state = context.findAncestorStateOfType<_OnboardingPageState>();
          state?._handleContinuePressed();
        },
        child: Row(
          children: const [
            Spacer(),
            Text('Continue', style: AppTextStyles.labelLargeButton),
            Spacer(),
            _ArrowIcon(),
          ],
        ),
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  const _ArrowIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.arrowRrightIcon);
  }
}
