import 'package:flutter/material.dart';

/// Creates a Widget to represent the months.
class MonthItem extends StatelessWidget {
  final String name;
  final Function onTap;
  final bool isSelected;
  final Color? color;

  final double scale;

  MonthItem({
    required this.name,
    required this.onTap,
    this.isSelected = false,
    this.color,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Text(
        this.name.toUpperCase(),
        style: TextStyle(
          fontSize: 14 * scale,
          color: color ?? Colors.black87,
          fontWeight: this.isSelected ? FontWeight.bold : FontWeight.w300,
        ),
      ),
    );
  }
}
