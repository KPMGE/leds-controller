import 'package:flutter/material.dart';
import 'package:leds/components/led-button.dart';
import 'package:http/http.dart' as http;

class Leds extends StatefulWidget {
  const Leds({Key? key}) : super(key: key);

  @override
  State<Leds> createState() => _LedsState();
}

class _LedsState extends State<Leds> {
  void makeRequest() async {
    http.Response r =
        await http.get(Uri.parse("http://localhost:3333/api/users"));
    if (r.statusCode == 200) {
      print("Got it");
      print(r.body);
    } else {
      print('Err');
      print(r.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.red,
            onPress: () {
              print("red pressed!");
              makeRequest();
            },
            text: 'Red',
          ),
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.green,
            onPress: () {
              print("green pressed!");
            },
            text: 'Green',
          ),
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.blue,
            onPress: () {
              print("blue pressed!");
            },
            text: 'Blue',
          ),
        ],
      ),
    );
  }
}
