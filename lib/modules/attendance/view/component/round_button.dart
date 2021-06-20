import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {Key? key,
      required this.colorList,
      required this.title,
      required this.onTap})
      : super(key: key);

  late final List<Color> colorList;
  late final String title;
  late final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: context.width * 0.5,
            height: context.width * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  -0.1,
                  0.4,
                  1.1,
                ],
                colors: colorList,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorList[1],
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                const Positioned.fill(
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.touch_app_outlined,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 30,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
