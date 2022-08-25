import 'package:flutter/material.dart';
import 'package:leds/components/leds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LEDS controller'),
          backgroundColor: Colors.blueGrey,
        ),
        body: const Leds(),
      ),
    );
  }
}
