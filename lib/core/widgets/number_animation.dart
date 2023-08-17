import 'package:flutter/material.dart';

class NumberAnimationWidget extends StatefulWidget {
  final int targetNumber;

  const NumberAnimationWidget({super.key, required this.targetNumber});

  @override
  State<NumberAnimationWidget> createState() => _NumberAnimationWidgetState();
}

class _NumberAnimationWidgetState extends State<NumberAnimationWidget>
    with TickerProviderStateMixin {
  late int _currentNumber;
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _currentNumber = 0; // Start with the target number
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Change duration as needed
    );

    _animation = IntTween(begin: _currentNumber, end: widget.targetNumber)
        .animate(_controller);

    _animation.addListener(() {
      setState(() {
        _currentNumber = _animation.value;
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_currentNumber', style: const TextStyle(fontSize: 24));
  }
}
