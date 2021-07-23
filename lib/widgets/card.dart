import 'package:flutter/material.dart';

import '../themes.dart';

class MyCard extends StatelessWidget {
  final String measure;
  final String date;
  final String time;
  final String AM_PM;

  const MyCard({
    Key key,
    this.measure,
    this.date,
    this.time,
    this.AM_PM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Main Container
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cLightGrey,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                spreadRadius: 4,
                blurRadius: 4,
                color: AppColors.cLightGrey,
                offset: Offset(0, 4))
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            showBottomBorder: true,
            headingRowColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected))
                return Colors.amber[800];
              return Colors.indigo; // Use the default value.
            }),
            rows: [
              DataRow(
                cells: const [
                  DataCell(Text("data 1")),
                  DataCell(Text("data 2 .. Description")),
                ],
              ),
            ],
            columns: const [
              DataColumn(
                  label: Text("date", style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text("Measure .. Description",
                      style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
