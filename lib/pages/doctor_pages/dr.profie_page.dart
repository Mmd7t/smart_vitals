import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/user_profile_model.dart';
import 'package:smart_vitans/services/profile_service.dart';
import 'package:smart_vitans/shared_prefs.dart';
import 'package:smart_vitans/widgets/DrTitleText_page.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import 'package:smart_vitans/widgets/Gradient_text.dart';
import 'package:smart_vitans/widgets/Gray_line.dart';
import 'package:smart_vitans/widgets/drInformation_page.dart';

import '../../themes.dart';

class DrProfile extends StatefulWidget {
  @override
  _DrProfileState createState() => _DrProfileState();
}

class _DrProfileState extends State<DrProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<UserProfileModel>(
        future: ProfileService.profile(Constants.userId),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
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
                      child: DrTitleText(
                        text: 'DR.Profile',
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
                      padding:
                          const EdgeInsets.only(top: 16, bottom: 16, left: 32),
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
                          const SizedBox(width: 8),
                          GradientText(
                            text: snapshot.data.response.name,
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
                    text: 'Dr.information',
                    font: AppFonts.profile,
                  ),
                ),
                const SizedBox(height: 16),
                DrInformation(
                  email: snapshot.data.response.email,
                  age: snapshot.data.response.age ?? '',
                  gender: snapshot.data.response.gender ?? '',
                  speciality: snapshot.data.response.speciality ?? '',
                  city: snapshot.data.response.city ?? '',
                ),
                const SizedBox(height: 16),
                GrayLine(size: size),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GradientText(
                    text: 'My Rating:',
                    font: AppFonts.profile,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GradientText(
                    text: snapshot.data.response.rating.toString(),
                    font: AppFonts.profile,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
