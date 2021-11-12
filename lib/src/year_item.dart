import 'package:flutter/material.dart';

/// Creates a Widget to represent the years. By default it will show the smaller version
/// in the months row. If [small] is set to false it will show the bigger version for the
/// years row. In the smaller version the [onTap] property is not available
class YearItem extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final bool isSelected;
  final Color? color;
  final bool small;
  final double scale;

  YearItem({
    required this.name,
    required this.onTap,
    this.isSelected = false,
    this.small = true,
    this.scale = 1.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: small ? null : onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 14.0,
          right: 14.0,
          top: 3.0,
          bottom: 2.0,
        ),
        decoration: isSelected || small
            ? BoxDecoration(
                border: Border.all(color: color ?? Colors.black87, width: 1),
                borderRadius: BorderRadius.circular(4),
              )
            : null,
        child: Text(
          name.toUpperCase(),
          style: TextStyle(
            fontSize: small ? (14 * scale) : (20 * scale),
            color: color ?? Colors.black87,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ),
    );
  }
}
