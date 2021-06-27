import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hris_mobile/utils/extension/extension.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';

class MonthSelection extends StatefulWidget {
  MonthSelection({Key? key}) : super(key: key);

  @override
  _MonthSelectionState createState() => _MonthSelectionState();
}

class _MonthSelectionState extends State<MonthSelection> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _locale = Localizations.localeOf(context);
    return Container(
      height: 60,
      width: context.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade50,
            spreadRadius: 1,
            blurRadius: 20, // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _date = _date.minus(month: 1);
              });
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Icon(
                Icons.chevron_left,
                size: 24,
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: FaIcon(
                    FontAwesomeIcons.calendarAlt,
                    size: 18,
                    color: Colors.blue,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 7),
                ),
                TextSpan(
                  text: _date.toStringAsMonthYear(_locale),
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _date = _date.plus(month: 1);
              });
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Icon(
                Icons.chevron_right,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
