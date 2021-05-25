import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  final int dayNumber;
  final String shortName;
  final bool isDimmed;
  final bool isSelected;
  final bool hasEvents;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;

  final double scale;

  final double height;
  final double width;

  DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isDimmed = false,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.hasEvents = false,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.scale = 1.0,
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
        fontSize: 32 * scale,
        fontWeight: FontWeight.normal);
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: 32 * scale,
      fontWeight: FontWeight.bold,
      height: 0.8,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color:
                    activeDayBackgroundColor ?? Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(12.0),
              )
            : BoxDecoration(color: Colors.transparent),
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            if (isSelected)
              SizedBox(height: 14.0 * scale)
            else
              SizedBox(height: 7.0 * scale),
            Text(
              dayNumber.toString(),
              style: isSelected ? selectedStyle : textStyle,
            ),
            Text(
              shortName,
              style: TextStyle(
                color: isDimmed || !available
                    ? (dayNameColor == null
                        ? Colors.white.withOpacity(0.5)
                        : dayNameColor!.withOpacity(0.5))
                    : dayNameColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14 * scale,
              ),
            ),
            SizedBox(height: 4.0 * scale),
            if (hasEvents && !isDimmed) _buildDot(),
          ],
        ),
      ),
    );
  }

  Widget _buildDot() {
    final dot = Container(
      height: 5 * scale,
      width: 5 * scale,
      decoration: new BoxDecoration(
        color: this.dotsColor ?? this.activeDayColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [dot],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
