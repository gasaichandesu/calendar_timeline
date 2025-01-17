import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  final int dayNumber;
  final String shortName;
  final bool isDimmed;
  final bool hasEvents;
  final bool available;
  final bool isSelected;
  final void Function()? onTap;
  final Color? dayColor;
  final Color? dotsColor;
  final Color? dayNameColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final double scale;
  final double height;
  final double width;
  final double? dayBorderRadius;

  DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isDimmed = false,
    this.available = true,
    this.hasEvents = false,
    this.isSelected = false,
    this.scale = 1.0,
    this.dayColor,
    this.dotsColor,
    this.dayNameColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.dayBorderRadius,
  })  : height = 70.0 * scale,
        width = 60.0 * scale,
        super(key: key);

  ///? I united both widgets to increase the touch target of non selected days by using a transparent box decorator.
  ///? Now if the user click close to the number but not straight on top it will still select the date. (ONLY INFORMATION - ERASE)
  _buildDay(BuildContext context) {
    final textStyle = TextStyle(
      color: available && !isDimmed
          ? dayColor ?? Theme.of(context).accentColor
          : dayColor?.withOpacity(0.5) ??
              Theme.of(context).accentColor.withOpacity(0.5),
      height: 1,
      fontSize: 32 * scale,
      fontWeight: FontWeight.normal,
    );

    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      height: 1,
      fontSize: 32 * scale,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: available ? onTap : null,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: isSelected
            ? BoxDecoration(
                color:
                    activeDayBackgroundColor ?? Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(dayBorderRadius ?? 12.0),
              )
            : BoxDecoration(color: Colors.transparent),
        child: Column(
          children: <Widget>[
            SizedBox(height: 13.0 * scale),
            Text(
              dayNumber.toString(),
              style: isSelected ? selectedStyle : textStyle,
            ),
            Text(
              shortName,
              style: TextStyle(
                fontSize: 14 * scale,
                height: 1,
                fontWeight: FontWeight.w500,
                color: isDimmed || !available
                    ? (dayNameColor == null
                        ? Colors.white.withOpacity(0.5)
                        : dayNameColor!.withOpacity(0.5))
                    : dayNameColor ?? Colors.white,
              ),
            ),
            SizedBox(height: 4.0 * scale),
            if (hasEvents) _buildDot(),
            SizedBox(height: 6.0 * scale),
          ],
        ),
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 5 * scale,
      height: 5 * scale,
      decoration: new BoxDecoration(
        color: this.dotsColor ?? this.activeDayColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
