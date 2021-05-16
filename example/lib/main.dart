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
        body: Center(
          child: CountStepper(iconColor: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
