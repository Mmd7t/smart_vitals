import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_vitans/pages/doctor_pages/doctor_mainpage.dart';
import 'package:smart_vitans/pages/partner_pages/partner_mainpage.dart';
import 'package:smart_vitans/pages/patient_pages/patient_mainpage.dart';
import 'package:smart_vitans/shared_prefs.dart';
import 'package:smart_vitans/widgets/heart_beat.dart';
import 'dart:async';
import '../themes.dart';
import 'registration/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int type;
  getUserType() async {
    type = await SharedPrefsHelper.getUserTypeFromPrefs();
    return type;
  }

  @override
  void initState() {
    super.initState();
    getUserType();
    Timer(
      Duration(seconds: 3),
      () {
        switch (type) {
          case 0:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => DoctorMainPage()));
            break;
          case 1:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => PatientMainPage()));
            break;
          case 2:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => PartnerMainPage()));
            break;
          default:
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignIN()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: [0, 1],
                    colors: [AppColors.clightGreen, AppColors.cDarkblue])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: AppColors.cWhite,
                        radius: size.width * 0.2,
                        child: SvgPicture.asset(
                          'assets/images/health-check.svg',
                          height: size.width * 0.25,
                          width: size.width * 0.25,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Smart Vitals',
                          style: AppFonts.logo.copyWith(
                            color: AppColors.cWhite,
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: HeartBeat(
                            color1: AppColors.clightGreen,
                            color2: AppColors.cWhite,
                            color3: AppColors.clightGreen,
                            isWhite: false),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
