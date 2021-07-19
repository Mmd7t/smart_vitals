import 'package:flutter/material.dart';

import '../../../themes.dart';

class ProfileInfo extends StatelessWidget {
  final String email;
  final String age;
  final String gender;
  const ProfileInfo({
    Key key,
    this.email,
    this.age,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
