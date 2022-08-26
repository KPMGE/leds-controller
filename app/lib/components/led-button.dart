import 'package:flutter/material.dart';

class LedButton extends StatefulWidget {
  final MaterialColor color;
  final String text;
  final void Function() onActive;
  final void Function() onDisabled;

  const LedButton({
    super.key,
    required this.color,
    required this.onActive,
    required this.onDisabled,
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
          if (_ledSelected) {
						super.widget.onActive();
						return;
					} 
					super.widget.onDisabled();
        });
      },
      child: Text(super.widget.text),
    );
  }
}
