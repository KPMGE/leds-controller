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

  void turnOnLed(String color) async {
    String ledParam = "";

    switch (color) {
      case "red": 
        ledParam = "red_on";
      break;

      case "green":
        ledParam = "green_on";
        break;

      case "blue":
        ledParam = "blue_on";
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
      print(r.body);
    }
  }

  void turnOffLed(String color) async {
    String ledParam = "";

    switch (color) {
      case "red":
        ledParam = "red_off";
        break;

      case "green":
        ledParam = "green_off";
        break;

      case "blue":
        ledParam = "blue_off";
        break;
      default:
        print("Invalid led!");
        return;
    }

    http.Response r = await http.get(Uri.parse(nodeUri + ledParam));
    if (r.statusCode == 200) {
      print(r.body);
    } else {
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
            onActive: () {
              turnOnLed("red");
            },
            onDisabled: () {
              turnOffLed("red");
            },
            text: 'Red',
          ),
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.green,
            onActive: () {
              turnOnLed("green");
            },
            onDisabled: () {
              turnOffLed("green");
            },
            text: 'Green',
          ),
          const SizedBox(height: 20.0),
          LedButton(
            color: Colors.blue,
            onActive: () {
              turnOnLed("blue");
            },
            onDisabled: () {
              turnOffLed("blue");
            },
            text: 'Blue',
          ),
        ],
      ),
    );
  }
}
