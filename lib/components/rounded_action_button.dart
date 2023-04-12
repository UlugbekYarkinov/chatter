import 'package:flutter/material.dart';

class RoundedActionButton extends StatelessWidget {
  const RoundedActionButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Color color;
  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
