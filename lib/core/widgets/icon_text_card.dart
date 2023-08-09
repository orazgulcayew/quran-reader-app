import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/config/theme/theme.dart';

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
    return Material(
      color: Colors.white,
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
                    color: AppTheme.primaryColor2.withOpacity(0.1)),
                child: Icon(
                  icon,
                  color: AppTheme.primaryColor2,
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
              const Icon(
                Iconsax.arrow_square_right,
                color: AppTheme.primaryColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
