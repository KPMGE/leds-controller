import 'package:flutter/material.dart';

class LedButton extends StatefulWidget {
  final MaterialColor color;
  final String text;
  final void Function() onPress;

  const LedButton({
    super.key,
    required this.color,
    required this.onPress,
    required this.text,
  });

  @override
  State<LedButton> createState() => _LedButtonState();
}

class _LedButtonState extends State<LedButton> {
  bool _ledSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _ledSelected ? super.widget.color : Colors.grey,
        minimumSize: const Size(200, 50),
      ),
      onPressed: () {
        setState(() {
          _ledSelected = !_ledSelected;
          super.widget.onPress();
        });
      },
      child: Text(super.widget.text),
    );
  }
}
