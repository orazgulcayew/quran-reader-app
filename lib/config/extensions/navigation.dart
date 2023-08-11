import 'package:flutter/material.dart';
import 'package:quran_reader_app/pages/names_of_allah/names_of_allah_page.dart';

extension Navigation on BuildContext {
  openAllahNamesPage() {
    Navigator.of(this).push(
        MaterialPageRoute(builder: (context) => const NamesOfAllahPage()));
  }

  goBack() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }
}
