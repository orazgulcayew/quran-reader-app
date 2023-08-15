import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/blocs/tesbih_counter/tesbih_counter_bloc.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:quran_reader_app/core/constants/constants.dart';

import 'package:quran_reader_app/core/widgets/custom_appbar.dart';
import 'package:quran_reader_app/injection_container.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../core/utils/dashed_painter.dart';
import '../../core/widgets/tesbih_piece.dart';

class TesbihCounterPage extends StatelessWidget {
  const TesbihCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BlocProvider<TesbihCounterBloc>(
      create: (context) => sl(),
      child: BlocBuilder<TesbihCounterBloc, TesbihCounterState>(
          builder: (context, state) {
        final blocProvider = BlocProvider.of<TesbihCounterBloc>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBar(title: 'Dhikr'),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Material(
                    elevation: 0.5,
                    borderRadius: BorderRadius.circular(20),
                    color: theme.background,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: ListTile.divideTiles(context: context, tiles: [
                        ListTile(
                          leading: const Icon(Iconsax.edit),
                          title: const Text('Session count'),
                          trailing: IntrinsicWidth(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                expands: false,
                                controller: TextEditingController(
                                    text: state.tesbihSessionCount.toString()),
                                textAlign: TextAlign.center,
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                onSubmitted: (value) {
                                  int newValue = int.tryParse(value) ??
                                      kDefaultTesbihSession;

                                  blocProvider.add(
                                    UpdateTesbihSessionCountEvent(
                                        newCount: newValue),
                                  );
                                },
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: '33',
                                    counterText: ''),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            updateHapticFeedback(state, blocProvider);
                          },
                          leading: const Icon(Bootstrap.phone_vibrate_fill),
                          trailing: Switch(
                            value: state.isHapticEnabled,
                            onChanged: (value) {
                              updateHapticFeedback(state, blocProvider);
                            },
                          ),
                          title: const Text('Vibrate'),
                        ),
                        ListTile(
                          onTap: () {
                            if (state.isHapticEnabled) {
                              HapticFeedback.vibrate();
                            }
                            blocProvider.add(ResetEvent());
                          },
                          leading: const Icon(Iconsax.refresh_left_square),
                          title: const Text('Reset'),
                        ),
                      ]).toList(),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: theme.primary)),
                  child: Text(state.period.toString()),
                ),
                SizedBox(
                  height: 20,
                  child: CustomPaint(
                    painter: DashedLinePainter(
                        dashSpace: 5,
                        dashWidth: 3,
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                const Gap(4),
                Draggable<int>(
                    data: 1,
                    onDragStarted: () {
                      if (state.isHapticEnabled) {
                        HapticFeedback.heavyImpact();
                      }
                    },
                    feedback: const SizedBox(
                      width: 90,
                      height: 90,
                      child: TesbihPiece(showText: false),
                    ),
                    child: const TesbihPiece()),
                const Gap(4),
                SizedBox(
                  height: 40,
                  child: CustomPaint(
                    painter: DashedLinePainter(
                        dashSpace: 5,
                        dashWidth: 3,
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                const Gap(2),
                DragTarget<int>(
                  onAccept: (data) {
                    if (state.isHapticEnabled) {
                      HapticFeedback.heavyImpact();
                    }
                    blocProvider.add(IncrementCounterEvent());
                  },
                  onLeave: (data) {},
                  onMove: (details) {},
                  onAcceptWithDetails: (details) {},
                  onWillAccept: (data) {
                    return true;
                  },
                  builder: (context, candidateData, rejectedData) {
                    return CircularStepProgressIndicator(
                      totalSteps: state.tesbihSessionCount,
                      currentStep: state.tesbihCount,
                      stepSize: 8,
                      selectedColor: AppTheme.primaryColor,
                      unselectedColor: theme.secondaryContainer,
                      padding: 0,
                      width: 160,
                      height: 160,
                      selectedStepSize: 12,
                      roundedCap: (_, __) => true,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${state.tesbihCount}/${state.tesbihSessionCount}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Gap(12),
              ],
            ),
          ),
        );
      }),
    );
  }

  void updateHapticFeedback(
      TesbihCounterState state, TesbihCounterBloc blocProvider) {
    if (!state.isHapticEnabled) {
      HapticFeedback.lightImpact();
    }
    blocProvider.add(UpdateHapticFeedbackEvent());
  }
}
