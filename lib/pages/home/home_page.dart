import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/config/extensions/navigation.dart';
import 'package:quran_reader_app/core/constants/constants.dart';
import 'package:quran_reader_app/core/widgets/icon_text_card.dart';
import 'package:quran_reader_app/core/widgets/wave_card.dart';

import '../../config/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          const WaveCard(
              waveColor: AppTheme.primaryColor,
              backgroundColor: AppTheme.primaryColor2,
              imageUrl: quranBigIllustration,
              title: "Read Quran",
              description: ''),
          const Gap(20),
          const Text(
            'Explore',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          Expanded(
            child: ListView(
              children: [
                IconTextCard(
                  icon: FlutterIslamicIcons.solidQuran,
                  title: "The Quran",
                  onPressed: () {},
                ),
                const Gap(12),
                IconTextCard(
                  icon: FlutterIslamicIcons.solidAllah,
                  title: "Names of Allah",
                  onPressed: () {
                    context.openAllahNamesPage();
                  },
                ),
                const Gap(12),
                IconTextCard(
                  icon: FlutterIslamicIcons.solidMosque,
                  title: "Prayer times",
                  onPressed: () {},
                ),
                const Gap(12),
                IconTextCard(
                  icon: FlutterIslamicIcons.solidTasbih2,
                  title: "Tasbih",
                  onPressed: () {},
                ),
                const Gap(12),
                IconTextCard(
                  icon: Iconsax.heart,
                  title: "Favorites",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
