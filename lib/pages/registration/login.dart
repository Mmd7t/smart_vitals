import 'package:flutter/material.dart';
import 'package:smart_vitans/models/registration_model.dart';
import 'package:smart_vitans/pages/doctor_pages/doctor_mainpage.dart';
import 'package:smart_vitans/pages/partner_pages/partner_mainpage.dart';
import 'package:smart_vitans/pages/patient_pages/patient_mainpage.dart';
import 'package:smart_vitans/services/registration_services.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import 'package:smart_vitans/widgets/global_textfield.dart';
import '../../shared_prefs.dart';
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
  final formKey = GlobalKey<FormState>();

  String email, password;
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
            const SizedBox(height: 40),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientBoarder(
                    size: size,
                    widget: GlobalTextField(
                      icon: 'email',
                      hint: 'Email',
                      obscure: false,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Email';
                        } else if (!value.contains('@')) {
                          return 'Please enter valid email';
                        } else {
                          return null;
                        }
                      },
                      onSave: (value) => setState(() => email = value),
                    ),
                    width: size.width * 0.75,
                    rad: 50,
                  ),
                  const SizedBox(height: 20),
                  GradientBoarder(
                    size: size,
                    widget: GlobalTextField(
                      icon: 'padlock',
                      hint: 'Password',
                      obscure: true,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 digits';
                        } else {
                          return null;
                        }
                      },
                      onSave: (value) => setState(() => password = value),
                    ),
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
                        value: 0,
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
                      /*--------------------  2nd Radio  --------------------*/
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
                      /*--------------------  3rd Radio  --------------------*/
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
                      const Text("Partner"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Button(
                    size: size,
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        RegistrationServices.login(LoginModel(
                          email: email,
                          password: password,
                        )).then((value) {
                          if (value) {
                            print(
                                'login successfullyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
                            SharedPrefsHelper.saveUserTypeToPrefs(val);
                            switch (val) {
                              case 0:
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorMainPage()));
                                break;
                              case 1:
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PatientMainPage()));
                                break;
                              case 2:
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PartnerMainPage()));
                                break;
                              default:
                            }
                          } else {
                            print(
                                'errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
                          }
                        });
                      }
                    },
                  ),
                  SizedBox(height: 24),
                  Button(
                    size: size,
                    text: 'Sign Up',
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
