import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/user_profile_model.dart';
import 'package:smart_vitans/services/profile_service.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import 'package:smart_vitans/widgets/Gradient_text.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/Pinformation_page.dart';
import 'package:smart_vitans/widgets/partner.Title.Text.dart';

import '../../themes.dart';

class PProfile extends StatefulWidget {
  @override
  _PProfileState createState() => _PProfileState();
}

class _PProfileState extends State<PProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<UserProfileModel>(
          future: ProfileService.profile(Constants.userId),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GradientBox(
                        size: size.height * 0.22,
                        radius: 56,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: PTitleText(
                          text: 'Profile',
                          arrowcolor: AppColors.cdarkwhite,
                          withicon: false,
                          gradienttext: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
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
                              text: 'Liam Nesson',
                              font: AppFonts.profile,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GradientText(
                      text: 'My information',
                      font: AppFonts.profile,
                    ),
                  ),
                  SizedBox(height: 16),
                  PInformation(
                    email: 'lima@99.com',
                    age: '22',
                    gender: 'male',
                    city: 'cairo',
                  ),
                  SizedBox(height: 16),
                  GrayLine(size: size),
                ],
              );
            }
          }),
    );
  }
}
