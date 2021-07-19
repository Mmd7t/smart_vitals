import 'package:flutter/material.dart';
import 'package:smart_vitans/pages/doctor_pages/doctor_home.dart';
import 'package:smart_vitans/pages/doctor_pages/doctor_mainpage.dart';
import 'package:smart_vitans/pages/partner_pages/partner_home.dart';
import 'package:smart_vitans/pages/partner_pages/partner_mainpage.dart';
import 'package:smart_vitans/pages/patient_pages/patient_home.dart';
import 'package:smart_vitans/pages/patient_pages/patient_mainpage.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import '../../themes.dart';
import 'privet_component/AppBar.dart';
import 'privet_component/button.dart';
import 'privet_component/input_field.dart';
import 'signup.dart';

class SignIN extends StatefulWidget {
  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  var val = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              size: size,
              text: 'Log In',
            ),
            SizedBox(height: size.height * 0.09),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Email', 'email', true),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 24),
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Password', 'padlock', true,
                      isPass: true),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 8),
                Container(
                  width: size.width * 0.75,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Forgot your password?',
                      style: AppFonts.forgot.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.clightGreen),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                /*------------------------------  Radio Buttons  -------------------------------*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*--------------------  1st Radio  --------------------*/
                    Radio(
                      value: 1,
                      toggleable: true,
                      groupValue: val,
                      onChanged: (value) {
                        setState(
                          () {
                            val = value;
                          },
                        );
                      },
                    ),
                    const Text("Patient"),
                    /*--------------------  2nd Radio  --------------------*/
                    Radio(
                      value: 2,
                      toggleable: true,
                      groupValue: val,
                      onChanged: (value) {
                        setState(
                          () {
                            val = value;
                          },
                        );
                      },
                    ),
                    const Text("Doctor"),
                    /*--------------------  3rd Radio  --------------------*/
                    Radio(
                      value: 3,
                      toggleable: true,
                      groupValue: val,
                      onChanged: (value) {
                        setState(
                          () {
                            val = value;
                          },
                        );
                      },
                    ),
                    const Text("Partner"),
                  ],
                ),
                SizedBox(height: 20),
                Button(
                  size: size,
                  text: 'Login',
                  onTap: () {
                    switch (val) {
                      case 1:
                        print('Patient');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PatientMainPage()));
                        break;
                      case 2:
                        print('Doctor');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DoctorMainPage()));
                        break;
                      case 3:
                        print('Partner');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PartnerMainPage()));
                        break;
                      default:
                    }
                  },
                ),
                SizedBox(height: 24),
                Button(
                  size: size,
                  text: 'Sign Up',
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp())),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
