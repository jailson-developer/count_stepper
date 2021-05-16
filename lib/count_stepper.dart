library count_stepper;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void OnTapCallback(int newValue);

class CountStepper extends StatefulWidget {
  /// Value default */
  final int defaultValue;

  /// Max value */
  final int max;

  /// Min value */
  final int min;

  /// Controller to retrieve the current value */
  final StepperController? controller;

  /// Space between the buttons and the text */
  final double space;

  /// Callback onPressed */
  final OnTapCallback? onPressed;

  /// Icon from increment action, default value is Icon(Icons.add_circle) */
  final Widget? iconIncrement;

  /// iconIncrement color, if the property is filled, it will overwrite the color informed in iconColor*/
  final Color? iconIncrementColor;

  /// Icon from Decrement action, default value is Icon(Icons.remove_circle_outline) */
  final Widget? iconDecrement;

  /// IconDecrement color, if the property is filled, it will overwrite the color informed in iconColor*/
  final Color? iconDecrementColor;

  /// Color default from buttons */
  final Color? iconColor;

  /// Radius of buttons */
  final double splashRadius;

  /// TextStyle of text*/
  final TextStyle? textStyle;

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
    this.iconColor,
    this.splashRadius = 15.0,
    this.textStyle,
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
    actual = widget.defaultValue;
    _iconIncrement = widget.iconIncrement ??
        Icon(Icons.add_circle,
            color: widget.iconIncrementColor ?? widget.iconColor);
    _iconDecrement = widget.iconDecrement ??
        Icon(Icons.remove_circle_outline,
            color: widget.iconDecrementColor ?? widget.iconColor);
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
        Text(actual.toString(), style: widget.textStyle),
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
