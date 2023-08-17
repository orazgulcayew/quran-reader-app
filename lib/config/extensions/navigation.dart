import 'package:flutter/material.dart';
import 'package:quran_reader_app/pages/names_of_allah/names_of_allah_page.dart';
import 'package:quran_reader_app/pages/qibla_direction/qibla_direction_page.dart';
import 'package:quran_reader_app/pages/tesbih_counter/tesbih_counter_page.dart';

extension Navigation on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  openAllahNamesPage() {
    push(const NamesOfAllahPage());
  }

  openTasbihCounterPage() {
    push(const TesbihCounterPage());
  }

  openQiblaDirectionPage() {
    push(const CompassWithQiblah());
  }

  goBack() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }
}
