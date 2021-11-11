import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  final int dayNumber;
  final String shortName;
  final bool isDimmed;
  final bool hasEvents;
  final bool available;
  final bool isSelected;
  final Function onTap;
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
      fontWeight: FontWeight.normal,
      fontSize: 32 * scale,
    );

    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 32 * scale,
      height: 0.8,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: (isSelected ? 13.0 : 6.0) * scale),
                Text(
                  dayNumber.toString(),
                  style: isSelected ? selectedStyle : textStyle,
                ),
                Text(
                  shortName,
                  style: TextStyle(
                    fontSize: 14 * scale,
                    fontWeight: FontWeight.w500,
                    color: isDimmed || !available
                        ? (dayNameColor == null
                            ? Colors.white.withOpacity(0.5)
                            : dayNameColor!.withOpacity(0.5))
                        : dayNameColor ?? Colors.white,
                  ),
                ),
              ],
            ),
            if (hasEvents && !isDimmed)
              Positioned.fill(
                bottom: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildDot(),
                ),
              ),
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
