import 'package:flutter/material.dart';

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

class Leds extends StatefulWidget {
  const Leds({Key? key}) : super(key: key);

  @override
  State<Leds> createState() => _LedsState();
}

class _LedsState extends State<Leds> {
  var _redSelected = false;
  var _greenSelected = false;
  var _blueSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: _redSelected ? Colors.red : Colors.grey,
              minimumSize: const Size(200, 50),
            ),
            onPressed: () {
              setState(() {
                _redSelected = !_redSelected;
              });
            },
            child: const Text('Red'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: _greenSelected ? Colors.green : Colors.grey,
              minimumSize: const Size(200, 50),
            ),
            onPressed: () {
              setState(() {
                _greenSelected = !_greenSelected;
              });
            },
            child: const Text('Green'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: _blueSelected ? Colors.blue : Colors.grey,
              minimumSize: const Size(200, 50),
            ),
            onPressed: () {
              setState(() {
                _blueSelected = !_blueSelected;
              });
            },
            child: const Text('Blue'),
          )
        ],
      ),
    );
  }
}
