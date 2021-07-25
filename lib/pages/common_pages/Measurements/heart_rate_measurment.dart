import 'package:flutter/material.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/get_data_model.dart';
import 'package:smart_vitans/services/get_data_services.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';
import '../../../themes.dart';

class HeartRateMeasure extends StatefulWidget {
  const HeartRateMeasure({Key key}) : super(key: key);

  @override
  _HeartRateMeasureState createState() => _HeartRateMeasureState();
}

class _HeartRateMeasureState extends State<HeartRateMeasure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48, left: 0, bottom: 48),
              child: TitleText(
                text: 'Heart Rate',
                arrowcolor: AppColors.clightGreen,
                icon: 'heart-rate-monitor',
              ),
            ),
            Center(
              child: Text(
                'Measurement\nHistory',
                style: AppFonts.buttonText.copyWith(color: AppColors.cblack),
              ),
            ),
            const SizedBox(height: 16),
            //
            //
            //
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
                  child: FutureBuilder<MeasuresListModel>(
                      future:
                          GetDateServices.getHeartRateList(Constants.userId),
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
                                          '${snapshot.data.response[index].value}'),
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
