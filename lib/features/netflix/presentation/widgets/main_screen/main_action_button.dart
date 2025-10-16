import 'package:flutter/material.dart';

class MainActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color fgColor;
  const MainActionButton({
    super.key,
    required this.width,
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.fgColor,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: LinearBorder(),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        fixedSize: Size.fromWidth(width),
      ),
      onPressed: () {},
      label: Text(label),
      icon: Icon(icon),
    );
  }
}
