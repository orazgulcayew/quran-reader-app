import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

enum CircularButtonType { primary, secondary, tertiary }

class CircularButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final IconData? icon;
  final CircularButtonType type;

  const CircularButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.type = CircularButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: getButtonColor(type),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: getChilColor(type)),
              ),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    icon,
                    color: getChilColor(type),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Color getButtonColor(CircularButtonType type) {
    switch (type) {
      case CircularButtonType.primary:
        return AppTheme.primaryColor2;
      case CircularButtonType.secondary:
        return AppTheme.white;
      case CircularButtonType.tertiary:
        return AppTheme.secondaryColor;
    }
  }

  Color getChilColor(CircularButtonType type) {
    switch (type) {
      case CircularButtonType.primary:
        return AppTheme.white;
      case CircularButtonType.secondary:
        return AppTheme.black;
      case CircularButtonType.tertiary:
        return AppTheme.black;
    }
  }
}
