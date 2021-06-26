import 'package:flutter/material.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/view/component/month_selection.dart';
import 'package:hris_mobile/utils/ui/background/background.dart';
import 'package:hris_mobile/utils/extension/extension.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';

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

    List<DataRow> getDataRow() {
      var dataRow = <DataRow>[];
      for (var x = 0; x < 9; x++) {
        dataRow.add(
          DataRow(
            cells: [
              DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '11',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -2,
                          ),
                        ),
                        const Text(
                          'TUE',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DataCell(
                RichText(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.south_east,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 3),
                      ),
                      TextSpan(
                        text: '09:15',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              DataCell(
                RichText(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.north_east,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 3),
                      ),
                      TextSpan(
                        text: '18:45',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              DataCell(
                RichText(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '08h 30m',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return dataRow;
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                        dataRowHeight: 65,
                        columnSpacing: 30,
                        columns: [
                          const DataColumn(
                            label: Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              'Check In',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              'Check Out',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              'Working Hours',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                        rows: getDataRow(),
                      ),
                    ),
                  ),
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
                  