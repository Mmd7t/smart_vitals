import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/models/registration_model.dart';
import 'package:smart_vitans/pages/doctor_pages/doctor_mainpage.dart';
import 'package:smart_vitans/pages/partner_pages/partner_mainpage.dart';
import 'package:smart_vitans/pages/patient_pages/patient_mainpage.dart';
import 'package:smart_vitans/providers/user_id_provider.dart';
import 'package:smart_vitans/services/registration_services.dart';
import 'package:smart_vitans/shared_prefs.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import 'package:smart_vitans/widgets/global_textfield.dart';
import '../../themes.dart';
import 'privet_component/AppBar.dart';
import 'privet_component/button.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var val = 0;
  int pageviewVal = 0;

  final formKey = GlobalKey<FormState>();

  String name,
      email,
      password,
      age,
      gender,
      address,
      city,
      phone,
      speciality,
      partnerId,
      doctorId;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userId = Provider.of<UserIdProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(size: size, text: 'Sign Up'),
            const SizedBox(height: 15),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientBoarder(
                    size: size,
                    widget: GlobalTextField(
                      icon: 'email',
                      hint: 'Full Name',
                      obscure: false,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Name';
                        } else {
                          return null;
                        }
                      },
                      onSave: (value) => setState(() => name = value),
                    ),
                    width: size.width * 0.75,
                    rad: 50,
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  Container(
                    width: size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GradientBoarder(
                          size: size,
                          widget: GlobalTextField(
                            icon: 'padlock',
                            hint: 'Age',
                            obscure: false,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter Age';
                              } else {
                                return null;
                              }
                            },
                            onSave: (value) => setState(() => age = value),
                          ),
                          width: size.width * 0.35,
                          rad: 50,
                        ),
                        const SizedBox(width: 8),
                        GradientBoarder(
                          size: size,
                          widget: GlobalTextField(
                            icon: 'padlock',
                            hint: 'Gender',
                            obscure: false,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter Gender';
                              } else {
                                return null;
                              }
                            },
                            onSave: (value) => setState(() => gender = value),
                          ),
                          width: size.width * 0.35,
                          rad: 50,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  GradientBoarder(
                    size: size,
                    widget: GlobalTextField(
                      icon: 'email',
                      hint: 'Phone',
                      obscure: false,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Phone';
                        } else {
                          return null;
                        }
                      },
                      onSave: (value) => setState(() => phone = value),
                    ),
                    width: size.width * 0.75,
                    rad: 50,
                  ),
                  const SizedBox(height: 10),
                  GradientBoarder(
                    size: size,
                    widget: GlobalTextField(
                      icon: 'email',
                      hint: 'Address',
                      obscure: false,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Address';
                        } else {
                          return null;
                        }
                      },
                      onSave: (value) => setState(() => address = value),
                    ),
                    width: size.width * 0.75,
                    rad: 50,
                  ),
                  const SizedBox(height: 10),
                  GradientBoarder(
                    size: size,
                    widget: GlobalTextField(
                      icon: 'email',
                      hint: 'City',
                      obscure: false,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter City';
                        } else {
                          return null;
                        }
                      },
                      onSave: (value) => setState(() => city = value),
                    ),
                    width: size.width * 0.75,
                    rad: 50,
                  ),
                  const SizedBox(height: 10),
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
                              pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
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
                              pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
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
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                          );
                        },
                      ),
                      const Text("Partner"),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.18,
                    child: PageView.builder(
                      itemCount: 3,
                      onPageChanged: (value) {
                        setState(() {});
                      },
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        child: (index == 0)
                            ? Center(
                                child: GradientBoarder(
                                  size: size,
                                  widget: GlobalTextField(
                                    icon: 'email',
                                    hint: 'speciality',
                                    obscure: false,
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please enter speciality';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSave: (value) =>
                                        setState(() => speciality = value),
                                  ),
                                  width: size.width * 0.75,
                                  rad: 50,
                                ),
                              )
                            : (index == 1)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GradientBoarder(
                                        size: size,
                                        widget: GlobalTextField(
                                          icon: 'email',
                                          hint: 'Partner id',
                                          obscure: false,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'Please enter Partner id';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSave: (value) =>
                                              setState(() => partnerId = value),
                                        ),
                                        width: size.width * 0.75,
                                        rad: 50,
                                      ),
                                      const SizedBox(height: 16),
                                      GradientBoarder(
                                        size: size,
                                        widget: GlobalTextField(
                                          icon: 'email',
                                          hint: 'Doctor id',
                                          obscure: false,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'Please enter Doctor id';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSave: (value) =>
                                              setState(() => doctorId = value),
                                        ),
                                        width: size.width * 0.75,
                                        rad: 50,
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                      ),
                    ),
                  ),
                  Button(
                    size: size,
                    text: 'Sign Up',
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        RegistrationServices.register(RegistrationModel(
                          name: name,
                          email: email,
                          password: password,
                          type: val,
                          city: city,
                          address: address,
                          age: int.parse(age),
                          gender: gender,
                          doctorId:
                              (doctorId == null) ? null : int.parse(doctorId),
                          partnerId:
                              (partnerId == null) ? null : int.parse(partnerId),
                          mobile: phone,
                          speciality: speciality,
                        )).then((value) {
                          if (value) {
                            print('signup successfully');

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
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
