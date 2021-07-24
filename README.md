# Count Stepper for Flutter

[![license: BSD](https://img.shields.io/badge/license-BSD-yellow.svg)](https://opensource.org/licenses/BSD-3-Clause)

A simple Flutter widget that allows you to increase/decrease a value.

## Screenshots

![Image 1](https://raw.githubusercontent.com/jailson-developer/count_stepper/main/screenshots/1.png "Image 1")

### Customize individual color

![Image 2](https://raw.githubusercontent.com/jailson-developer/count_stepper/main/screenshots/2.png "Image 2")

### Example

``` dart
import 'package:flutter/material.dart';
import 'package:count_stepper/count_stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CountStepper(
          iconColor: Theme.of(context).primaryColor,
          defaultValue: 2,
          max: 10,
          min: 1,
          iconDecrementColor: Colors.red,
          splashRadius: 25,
          onPressed: (value) {},
        ),
      ),
    );
  }
}
```

## Usage

To use this package, add `count_stepper` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).
