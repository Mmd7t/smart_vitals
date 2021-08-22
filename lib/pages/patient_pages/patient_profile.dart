import 'package:flutter/material.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/user_profile_model.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/Glucose_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/Oxgyen_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/Tempreture_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/heart_rate_measurment.dart';
import 'package:smart_vitans/pages/common_pages/Measurements/pressure_mrasurment.dart';
import 'package:smart_vitans/services/profile_service.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import 'package:smart_vitans/widgets/Gradient_text.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/TitleTeaxt.dart';

import '../../themes.dart';
import 'components/profile_circule_info.dart';
import 'components/profile_info.dart';

class PatientProfile extends StatefulWidget {
  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List info = [
      ['heart-rate-monitor', 'Heart Rate', 'value1'],
      ['glucometer', 'Gulcose', 'value2'],
      ['thermometer', 'Temprature', 'value3'],
      ['oxygen-tank', 'Oxgyen', 'value4'],
      ['blood-pressure', 'Blood Preasure', 'value4']
    ];
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      body: FutureBuilder<UserProfileModel>(
          future: ProfileService.profile(Constants.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        GradientBox(size: size.height * 0.17, radius: 56),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TitleText(
                            text: 'Profile',
                            arrowcolor: AppColors.cdarkwhite,
                            withicon: false,
                            gradienttext: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          color: AppColors.cLightGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, bottom: 16, left: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GradientBoarder(
                                size: size,
                                rad: 101,
                                width: 100,
                                height: 100,
                                widget: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child:
                                        Image.asset('assets/images/profile.png')),
                              ),
                              SizedBox(width: 8),
                              GradientText(
                                text: '${snapshot.data.response.name}',
                                font: AppFonts.profile,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: GradientText(
                        text: 'User information:',
                        font: AppFonts.profile,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ProfileInfo(
                      email: '${snapshot.data.response.email}',
                      age: '${snapshot.data.response.age}',
                      gender: '${snapshot.data.response.gender}',
                      
                    ),
                    const SizedBox(height: 16),
                    GrayLine(size: size),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: GradientText(
                        text: 'Latest Measurements:',
                        font: AppFonts.profile,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileCirculeInfo(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HeartRateMeasure()));
                          },
                          size: size,
                          info: info[0],
                          update: true,
                        ),
                        ProfileCirculeInfo(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GlucoseMeasure()));
                          },
                          size: size,
                          info: info[1],
                          update: true,
                        ),
                        ProfileCirculeInfo(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TempMeasure()));
                          },
                          size: size,
                          info: info[2],
                          update: false,
                        ),
                        ProfileCirculeInfo(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OxygenMeasure()));
                          },
                          size: size,
                          info: info[3],
                          update: true,
                        ),
                        ProfileCirculeInfo(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PressureMeasure()));
                          },
                          size: size,
                          info: info[4],
                          update: false,
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
