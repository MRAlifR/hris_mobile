import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/view/component/month_selection.dart';
import 'package:hris_mobile/utils/ui/background/background.dart';
import 'package:hris_mobile/utils/extension/extension.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';
import 'dart:math' as math;

class AttendanceListScreen extends StatefulWidget {
  AttendanceListScreen({Key? key}) : super(key: key);
  static const id = 'attendance_list_screen';

  @override
  _AttendanceListScreenState createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {
  final checkInColorList = [
    '#3E80DD'.toColor(),
    '#6672D6'.toColor(),
    '#9A87E4'.toColor()
  ];
  final checkOutColorList = [
    '#8E3098'.toColor(),
    '#C8307D'.toColor(),
    '#F04980'.toColor(),
  ];

  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _locale = Localizations.localeOf(context);

    Widget getDataRow() {
      var dataRow = <Widget>[];
      for (var x = 0; x < 5; x++) {
        dataRow.add(AttendanceRow());
      }
      return Column(
        children: dataRow,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          _l10n.attendance,
          style: TextStyle(
            color: Colors.black87.withOpacity(0.8),
            fontSize: 23,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          Positioned.fill(
            top: 90,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  MonthSelection(),
                  AttendanceRowHeader(),
                  getDataRow(),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: checkInColorList[1],
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(
            label: _l10n.home,
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: _l10n.attendance,
            icon: const Icon(Icons.article),
          ),
          BottomNavigationBarItem(
            label: _l10n.profile,
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

class AttendanceRowHeader extends StatelessWidget {
  const AttendanceRowHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.045,
      color: '#FCF9FB'.toColor(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            width: context.width * 0.2,
            child: const Text(
              'Date',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: context.width * 0.2,
            child: const Text(
              'Check In',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: context.width * 0.2,
            child: const Text(
              'Check Out',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 17),
          Container(
            padding: const EdgeInsets.only(right: 18),
            width: context.width * 0.3,
            child: const Text(
              'Working Hr\'s',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceRow extends StatelessWidget {
  const AttendanceRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          width: context.width,
          height: context.height * 0.06,
          decoration: const BoxDecoration(
            color: Colors.white24,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: context.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 17,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '11',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -2,
                          ),
                        ),
                        const Text(
                          'TUE',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: context.width * 0.2,
                child: RichText(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.rotate(
                          angle: 45 * math.pi / 180,
                          child: const FaIcon(
                            FontAwesomeIcons.arrowRight,
                            size: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 1),
                      ),
                      const TextSpan(
                        text: '09:15',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: context.width * 0.2,
                child: RichText(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.rotate(
                          angle: 45 * math.pi / 180,
                          child: const FaIcon(
                            FontAwesomeIcons.arrowUp,
                            size: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 1),
                      ),
                      const TextSpan(
                        text: '18:45',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: context.width * 0.21,
                child: RichText(
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '08h 30m',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: context.width * 0.1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 3,
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: context.width * 0.22,
          color: Colors.grey.shade200,
        ),
      ],
    );
  }
}


// header,
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 10,
                  //     left: 15,
                  //     right: 15,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 12,
                  //           vertical: 6,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.grey.shade300),
                  //           shape: BoxShape.rectangle,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             const Text(
                  //               '11',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w900,
                  //                 letterSpacing: -2,
                  //               ),
                  //             ),
                  //             const Text(
                  //               'TUE',
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.w800,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       const SizedBox(width: 20),
                  //       Flexible(
                  //         child: RichText(
                  //           textAlign: TextAlign.center,
                  //           overflow: TextOverflow.ellipsis,
                  //           text: const TextSpan(
                  //             children: [
                  //               WidgetSpan(
                  //                 child: Icon(
                  //                   Icons.south_east,
                  //                   size: 18,
                  //                   color: Colors.blue,
                  //                 ),
                  //               ),
                  //               WidgetSpan(
                  //                 child: SizedBox(width: 3),
                  //               ),
                  //               TextSpan(
                  //                 text: '09:15',
                  //                 style: TextStyle(
                  //                     fontSize: 15,
                  //                     color: Colors.green,
                  //                     fontWeight: FontWeight.w900),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 20),
                  //       Flexible(
                  //         child: RichText(
                  //           textAlign: TextAlign.center,
                  //           overflow: TextOverflow.ellipsis,
                  //           text: const TextSpan(
                  //             children: [
                  //               WidgetSpan(
                  //                 child: Icon(
                  //                   Icons.north_east,
                  //                   size: 18,
                  //                   color: Colors.blue,
                  //                 ),
                  //               ),
                  //               WidgetSpan(
                  //                 child: SizedBox(width: 3),
                  //               ),
                  //               TextSpan(
                  //                 text: '18:45',
                  //                 style: TextStyle(
                  //                     fontSize: 15,
                  //                     color: Colors.green,
                  //                     fontWeight: FontWeight.w900),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 20),
                  //       Expanded(
                  //         child: RichText(
                  //           textAlign: TextAlign.end,
                  //           overflow: TextOverflow.ellipsis,
                  //           text: const TextSpan(
                  //             children: [
                  //               TextSpan(
                  //                 text: '08h 30m',
                  //                 style: TextStyle(
                  //                     fontSize: 15,
                  //                     color: Colors.green,
                  //                     fontWeight: FontWeight.w900),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Divider(
                  //   indent: 90,
                  // ),
                  