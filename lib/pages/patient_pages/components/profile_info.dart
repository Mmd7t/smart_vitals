import 'package:flutter/material.dart';

import '../../../themes.dart';

class ProfileInfo extends StatelessWidget {
  final String email;
  final String age;
  final String gender;
  final String doctorId;
  final String partnerId;
  const ProfileInfo({
    Key key,
    this.email,
    this.age,
    this.gender,
    this.doctorId,
    this.partnerId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email:$email',
                style: AppFonts.forgot.copyWith(
                  color: AppColors.cblack,
                )),
            SizedBox(
              height: 4,
            ),
            Text('Age:$age',
                style: AppFonts.forgot.copyWith(
                  color: AppColors.cblack,
                )),
            SizedBox(
              height: 4,
            ),
            Text('Gender:$gender',
                style: AppFonts.forgot.copyWith(
                  color: AppColors.cblack,
                )),
                Text('Doctor Id: $doctorId',
                style: AppFonts.forgot.copyWith(
                  color: AppColors.cblack,
                )),
            SizedBox(
              height: 4,
            ),
            Text('Partner: $partnerId',
                style: AppFonts.forgot.copyWith(
                  color: AppColors.cblack,
                )),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
