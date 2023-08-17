import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:quran_reader_app/blocs/settings/settings_bloc.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:quran_reader_app/core/utils/dashed_painter.dart';
import 'package:quran_reader_app/core/widgets/custom_appbar.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import 'package:smooth_compass/utils/src/widgets/error_widget.dart';

class CompassWithQiblah extends StatelessWidget {
  const CompassWithQiblah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Qiblah direction"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SmoothCompass(
            errorDecoration: ErrorDecoration(
              buttonText: ButtonText(),
              buttonStyle: ErrorButtonStyle(
                  borderRadius: BorderRadius.circular(20),
                  buttonColor: AppTheme.primaryColor,
                  textColor: AppTheme.white),
              messageTextStyle: TextStyle(color: theme.error),
            ),
            isQiblahCompass: true,
            compassBuilder: (context, snapshot, child) {
              if (isFacingWithQibla(snapshot?.data?.angle ?? 0.0,
                  snapshot?.data?.qiblahOffset ?? 0.0)) {
                HapticFeedback.selectionClick();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Icon(
                    FlutterIslamicIcons.solidKaaba,
                    size: 40,
                    color: isFacingWithQibla(snapshot?.data?.angle ?? 0.0,
                            snapshot?.data?.qiblahOffset ?? 0.0)
                        ? theme.onPrimaryContainer
                        : unfacingColor(settingsBloc.isDark),
                  ),
                  const Gap(16),
                  SizedBox(
                    height: 60,
                    child: CustomPaint(
                      painter: DashedLinePainter(
                          dashSpace: 5,
                          dashWidth: 3,
                          color: isFacingWithQibla(snapshot?.data?.angle ?? 0.0,
                                  snapshot?.data?.qiblahOffset ?? 0.0)
                              ? theme.onPrimaryContainer
                              : unfacingColor(settingsBloc.isDark)),
                    ),
                  ),
                  const Gap(8),
                  AnimatedRotation(
                    turns: snapshot?.data?.turns ?? 0 / 360,
                    duration: const Duration(milliseconds: 400),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //put your compass here
                        Image.asset(compass(settingsBloc.isDark)),
                        AnimatedRotation(
                          turns: (snapshot?.data?.qiblahOffset ?? 0) / 360,
                          duration: const Duration(milliseconds: 400),
                          child: SvgPicture.asset(
                            "assets/images/needle.svg",
                            height: 160,
                            color: settingsBloc.isDark
                                ? AppTheme.neutralLightColor
                                : AppTheme.primaryColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'The Qibla is at ${snapshot?.data?.qiblahOffset.toInt()}°',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Gap(24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool isFacingWithQibla(double currentAngle, double qiblaAngle) {
    return currentAngle.toInt() == qiblaAngle.toInt() ||
        currentAngle.toInt() - 1 == qiblaAngle.toInt() ||
        currentAngle.toInt() + 1 == qiblaAngle.toInt();
  }

  String compass(bool isDark) {
    return isDark
        ? "assets/images/compass_night.png"
        : "assets/images/compass.png";
  }

  unfacingColor(bool isDark) {
    return isDark ? Colors.white54 : Colors.black38;
  }
}
