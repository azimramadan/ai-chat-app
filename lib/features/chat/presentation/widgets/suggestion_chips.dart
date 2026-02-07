import 'package:ai_chat_app/core/constants/app_assets.dart';
import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:ai_chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key});

  static const List<SuggestionSection> _suggestions = [
    SuggestionSection(
      iconImagePath: AppAssets.explainIcon,
      title: 'Explain',
      questions: [
        'What are wormholes explain like i am 5',
        'What are wormholes explain like i am 5',
      ],
    ),
    SuggestionSection(
      iconImagePath: AppAssets.writeIcon,
      title: 'Write & edit',
      questions: [
        'Write a tweet about global warming',
        'Write a poem about flower and love',
        'Write a rap song lyrics about',
      ],
    ),
    SuggestionSection(
      iconImagePath: AppAssets.translateIcon,
      title: 'Translate',
      questions: [
        'How do you say "how are you" in korean?',
        'Write a poem about flower and love',
        'Write a poem about nature and the heart',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          top: index == 0 ? 20 : 30,
          bottom: index == _suggestions.length - 1 ? 20 : 0,
        ),
        child: _SuggestionSectionView(section: _suggestions[index]),
      ),
    );
  }
}

class _SuggestionSectionView extends StatelessWidget {
  final SuggestionSection section;

  const _SuggestionSectionView({required this.section});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(section.iconImagePath),
        const SizedBox(height: 5),
        Text(section.title, style: AppTextStyles.bodyLargeBold),
        const SizedBox(height: 18),

        ...section.questions.map(
          (question) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _SuggestionChip(question: question),
          ),
        ),
      ],
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String question;

  const _SuggestionChip({required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.surface,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          context.read<ChatCubit>().sendMessage(question);
        },
        child: Text(
          question,
          style: AppTextStyles.bodySmallSecondary,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SuggestionSection {
  final String iconImagePath;
  final String title;
  final List<String> questions;

  const SuggestionSection({
    required this.iconImagePath,
    required this.title,
    required this.questions,
  });
}
