import 'package:flutter/material.dart';

extension Navigation on BuildContext {}

class AppRoutes {
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
