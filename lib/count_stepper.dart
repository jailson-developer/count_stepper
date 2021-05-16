library count_stepper;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

typedef void OnTapCallback(int newValue);

class CountStepper extends StatefulWidget {
  final int defaultValue;
  final int max;
  final int min;
  final StepperController? controller;
  final double space;
  final OnTapCallback? onPressed;
  final Widget? iconIncrement;
  final Color? iconIncrementColor;
  final Widget? iconDecrement;
  final Color? iconDecrementColor;
  final double splashRadius;

  const CountStepper({
    Key? key,
    this.controller,
    this.defaultValue = 0,
    this.max = 999,
    this.min = -999,
    this.space = 10,
    this.onPressed,
    this.iconIncrement,
    this.iconDecrement,
    this.iconIncrementColor,
    this.iconDecrementColor,
    this.splashRadius = 15.0,
  }) : super(key: key);
  @override
  _CountStepperState createState() => _CountStepperState();
}

class _CountStepperState extends State<CountStepper> {
  int actual = 0;
  late Widget _iconIncrement;
  late Widget _iconDecrement;
  @override
  void initState() {
    final iconColor = Colors.red; //Theme.of(context).primaryColor;
    actual = widget.defaultValue;
    _iconIncrement = widget.iconIncrement ?? Icon(Icons.add_circle, color: widget.iconIncrementColor ?? iconColor);
    _iconDecrement =
        widget.iconDecrement ?? Icon(Icons.remove_circle_outline, color: widget.iconDecrementColor ?? iconColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller?.currentValue = actual;
    return Row(
      children: [
        IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
          splashRadius: widget.splashRadius,
          icon: _iconDecrement,
          onPressed: () {
            if (actual > widget.min)
              setState(() {
                actual--;
                if (widget.onPressed != null) widget.onPressed!(actual);
              });
          },
        ),
        SizedBox(width: widget.space),
        Text(actual.toString()),
        SizedBox(width: widget.space),
        IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
          splashRadius: widget.splashRadius,
          icon: _iconIncrement,
          onPressed: () {
            if (actual < widget.max)
              setState(() {
                actual++;
                if (widget.onPressed != null) widget.onPressed!(actual);
              });
          },
        ),
      ],
    );
  }
}

class StepperController {
  int currentValue = 0;
}
