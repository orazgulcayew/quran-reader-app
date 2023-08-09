import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:quran_reader_app/core/utils/wave_clipper.dart';
import 'package:quran_reader_app/core/widgets/buttons.dart';

class WaveCard extends StatelessWidget {
  final Color waveColor;
  final Color backgroundColor;
  final String imageUrl;
  final String title;
  final String description;

  const WaveCard(
      {super.key,
      required this.waveColor,
      required this.backgroundColor,
      required this.imageUrl,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 345 / 170,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppTheme.primaryColor,
                AppTheme.primaryColor2,
              ])),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  imageUrl,
                  height: 100,
                )),
            Positioned(
                left: 20,
                top: 12,
                bottom: 0,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Last read",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const Gap(12),
                    const Text(
                      "القرآن",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Majeed',
                      ),
                    ),
                    const Gap(4),
                    Text(
                      "Surah Ar Rahman 1 - 2",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    const Spacer(),
                    IntrinsicWidth(
                      child: CircularButton(
                        text: "Continue reading",
                        icon: Iconsax.arrow_right_1,
                        type: CircularButtonType.secondary,
                        onPressed: () {},
                      ),
                    ),
                    const Gap(12),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
