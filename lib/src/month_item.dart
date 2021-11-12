import 'package:flutter/material.dart';

/// Creates a Widget to represent the months.
class MonthItem extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final bool isSelected;
  final Color? color;

  final double scale;

  MonthItem({
    required this.name,
    required this.onTap,
    this.color,
    this.scale = 1.0,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        name.toUpperCase(),
        style: TextStyle(
          fontSize: 14 * scale,
          color: color ?? Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
        ),
      ),
    );
  }
}
