import 'package:flutter/material.dart';
import 'package:smart_vitans/models/get_data_model.dart';
import 'package:smart_vitans/services/get_data_services.dart';
import 'package:smart_vitans/widgets/NavBar.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import 'package:smart_vitans/widgets/card.dart';

import '../../../constants.dart';
import '../../../themes.dart';

class PressureMeasure extends StatefulWidget {
  const PressureMeasure({Key key}) : super(key: key);

  @override
  _PressureMeasureState createState() => _PressureMeasureState();
}

class _PressureMeasureState extends State<PressureMeasure> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48, left: 0, bottom: 48),
              child: TitleText(
                text: 'Pressure',
                arrowcolor: AppColors.clightGreen,
                icon: 'thermometer',
              ),
            ),
            Center(
              child: Text(
                'Measurement\n        History',
                style: AppFonts.buttonText.copyWith(color: AppColors.cblack),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // you should use Cubit to generate a list of MyCard acorrding to Back end data
            // all Mycard data should be replaced with Backend data
            Padding(
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
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: FutureBuilder<BloodPressureListModel>(
                      future: GetDateServices.getBloodPressureList(
                          Constants.userId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.response.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12),
                                child: ListTile(
                                  title: Text(
                                      '${snapshot.data.response[index].createdAt}'),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          '${snapshot.data.response[index].systolic}'),
                                      Text(
                                          '${snapshot.data.response[index].diastolic}'),
                                      Text(
                                          '${snapshot.data.response[index].desc}'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
