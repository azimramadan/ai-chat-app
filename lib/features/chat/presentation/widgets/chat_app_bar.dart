import 'package:ai_chat_app/core/constants/app_assets.dart';
import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      shape: const Border(bottom: BorderSide(color: AppColors.border)),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppAssets.arrowLeftIcon),
      ),
      title: Row(
        children: const [ChatAvatar(), SizedBox(width: 20), ChatTitleColumn()],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.volumeHigh),
        ),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.export)),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 36,
      child: Image.asset(AppAssets.blueRobot),
    );
  }
}

class ChatTitleColumn extends StatelessWidget {
  const ChatTitleColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ChatGPT', style: AppTextStyles.titleLargeAppBar),
        const SizedBox(height: 4),
        Row(
          children: const [
            CircleAvatar(radius: 3, backgroundColor: Colors.green),
            SizedBox(width: 8),
            Text('Online', style: AppTextStyles.titleSmallStatus),
          ],
        ),
      ],
    );
  }
}
