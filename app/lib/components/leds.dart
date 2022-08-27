import 'package:flutter/material.dart';
import 'package:app/components/led-button.dart';
import 'package:http/http.dart' as http;

class Leds extends StatefulWidget {
  const Leds({Key? key}) : super(key: key);

  @override
  State<Leds> createState() => _LedsState();
}

class _LedsState extends State<Leds> {
  final String nodeUri = "http://192.168.4.1/";

  void toggleLed(String color) async {
    String ledParam = "";

    switch (color) {
      case "red":
        ledParam = "toggle_red";
        break;

      case "green":
        ledParam = "toggle_green";
        break;

      case "blue":
        ledParam = "toggle_blue";
        break;
      default:
        print("Invalid led!");
        return;
    }

    http.Response r = await http.get(Uri.parse(nodeUri + ledParam));

    print(Uri.parse(nodeUri + ledParam));

    if (r.statusCode == 200) {
      print(r.body);
    } else {
      print("ERROR: ");
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
              toggleLed("red");
            },
            text: 'Red',
          ),
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.green,
            onPress: () {
              toggleLed("green");
            },
            text: 'Green',
          ),
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.blue,
            onPress: () {
              toggleLed("blue");
            },
            text: 'Blue',
          ),
        ],
      ),
    );
  }
}
