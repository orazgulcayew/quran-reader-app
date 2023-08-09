import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:quran_reader_app/core/constants/constants.dart';
import 'package:quran_reader_app/core/widgets/wave_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Gap(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: WaveCard(
              waveColor: AppTheme.primaryColor,
              backgroundColor: AppTheme.primaryColor2,
              imageUrl: quranBigIllustration,
              title: "Read Quran",
              description: ''),
        )
      ],
    );
  }
}
