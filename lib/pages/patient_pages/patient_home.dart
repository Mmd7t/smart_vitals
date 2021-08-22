import 'package:flutter/material.dart';
import 'package:smart_vitans/models/user_profile_model.dart';
import 'package:smart_vitans/pages/common_pages/addservicies.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/ECG_page.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/Glucose.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/Heart_rate.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/Oxygen.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/Tempreture.dart';
import 'package:smart_vitans/pages/common_pages/partner_n_patient/pressure.dart';
import 'package:smart_vitans/pages/patient_pages/bluetooth_page.dart';
import 'package:smart_vitans/pages/patient_pages/rate_doctor.dart';
import 'package:smart_vitans/services/profile_service.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';

import '../../constants.dart';
import '../../themes.dart';
import 'components/BoxButton.dart';
import 'components/Title_Box.dart';

class PatientHome extends StatefulWidget {
  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List buttons = [
      ['Blood Preasure', 'blood-pressure', PressureMain()],
      ['Oxgyen', 'oxygen-tank', OxygenMain()],
      ['Heart Rate', 'heart-rate-monitor', HeartRateMain()],
      ['Glocuse', 'glucometer', GlucoseMain()],
      ['Tempreature', 'thermometer', TempretureMain()],
      ['ECG', 'heart-rate-monitor', ECGMain()],
      ['Additional services', 'plus', AddServicies()],
      ['Rate Doctor', 'plus', RateDoctor()],
      ['Recieve Measures', 'plus', BluetoothPage()],
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FA),
      body: FutureBuilder<UserProfileModel>(
          future: ProfileService.profile(Constants.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String name = snapshot.data.response.name;
              String firstName = name.split(" ").first;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: (size.height / 3) + 50,
                      child: Stack(
                        children: [
                          GradientBox(
                            size: size.height / 3,
                            radius: 56.0,
                          ),
                          Positioned(
                            top: size.height / 9,
                            left: size.width * 0.08,
                            child: Text(
                              'Welcome back, $firstName', //get username from backend ex:sondos
                              style: AppFonts.buttonText
                                  .copyWith(color: AppColors.cWhite),
                            ),
                          ),
                          Positioned(
                            top: size.height / 5,
                            left: size.width * 0.14,
                            child: Text(
                              'How may I help ?',
                              style: AppFonts.maintext
                                  .copyWith(color: AppColors.cWhite),
                            ),
                          ),
                          Positioned(
                            left: size.width * 0.05,
                            top: (size.height / 3) - 10,
                            child: TitleBox(size: size),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.006),
                    Wrap(
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      spacing: 12,
                      children: List.generate(
                        buttons.length,
                        (index) => GradientBoarder(
                          widget: BoxButton(
                            size: size,
                            buttom: buttons[index],
                            width: size.width * 0.28,
                            height: size.width * 0.28,
                          ),
                          width: size.width * 0.28,
                          height: size.width * 0.28,
                          rad: 30,
                          size: size,
                          offesetX: 3,
                          offesetY: 3,
                          blur: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
