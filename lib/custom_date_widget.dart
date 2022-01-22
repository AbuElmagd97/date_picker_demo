/// ***
/// This class consists of the CustomDateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Gradient? gradient;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  CustomDateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.13,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22.0)),
          // color: selectionColor,
          gradient: gradient,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
              //     style: monthTextStyle),

              Text(DateFormat("E", locale).format(date), // WeekDay
                  style: dayTextStyle),
              Text(date.day.toString(), // Date
                  style:  dayTextStyle),
            ],
          ),
        ),
      ),
      onTap: () {
        debugPrint(date.toString());
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
