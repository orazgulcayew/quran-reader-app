import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

class TesbihPiece extends StatelessWidget {
  final bool showText;
  const TesbihPiece({
    super.key,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  AppTheme.primaryColor.withOpacity(0.7),
                  AppTheme.primaryColor2
                ])),
            child: Visibility(
              visible: showText,
              child: const Center(
                  child: Text(
                'Drag to bottom',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 12),
              )),
            ),
          ),
          IntrinsicWidth(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 20,
                    color: Colors.white.withOpacity(0.2))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
