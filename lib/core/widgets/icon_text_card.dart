import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class IconTextCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onPressed;
  const IconTextCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Material(
      color: theme.background,
      elevation: 0.5,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.primaryContainer),
                child: Icon(
                  icon,
                  color: theme.onPrimaryContainer,
                ),
              ),
              const Gap(12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Iconsax.arrow_square_right,
                color: theme.onPrimaryContainer,
              )
            ],
          ),
        ),
      ),
    );
  }
}
