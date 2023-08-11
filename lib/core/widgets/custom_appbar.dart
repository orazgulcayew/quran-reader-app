import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/config/extensions/navigation.dart';

import '../../config/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;
  final bool? centerTitle;
  final bool hasParent;

  const CustomAppBar(
      {super.key,
      this.actions = const [],
      required this.title,
      this.centerTitle,
      this.hasParent = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      centerTitle: centerTitle,
      title: Text(title),
      leading: hasParent
          ? IconButton(
              onPressed: () {
                context.goBack();
              },
              icon: Icon(
                Iconsax.arrow_square_left,
                color: AppTheme.white.withOpacity(0.8),
              ))
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
