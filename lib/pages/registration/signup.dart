import 'package:flutter/material.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';

import '../../themes.dart';
import 'privet_component/AppBar.dart';
import 'privet_component/button.dart';
import 'privet_component/input_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var val = 0;
  int pageviewVal = 0;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cdarkwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(size: size, text: 'Sign Up'),
            SizedBox(height: size.height * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Full Name', 'email', false),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 10),
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Email', 'email', false),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 10),
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Password', 'padlock', false,
                      isPass: true),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 10),
                Container(
                  width: size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GradientBoarder(
                        size: size,
                        widget: inputfield(size, 'Age', 'padlock', false),
                        width: size.width * 0.35,
                        rad: 50,
                      ),
                      SizedBox(width: 8),
                      GradientBoarder(
                        size: size,
                        widget: inputfield(size, 'Gender', 'padlock', false),
                        width: size.width * 0.35,
                        rad: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Phone', 'phone', false),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 10),
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'Address', 'address', false),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 10),
                GradientBoarder(
                  size: size,
                  widget: inputfield(size, 'City', 'city', false),
                  width: size.width * 0.75,
                  rad: 50,
                ),
                SizedBox(height: 10),
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
                            pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                        );
                      },
                    ),
                    const Text("Partner"),
                    /*--------------------  2nd Radio  --------------------*/
                    Radio(
                      value: 2,
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
                      value: 3,
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
                    const Text("Doctor"),
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
                          ? SizedBox()
                          : (index == 1)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientBoarder(
                                      size: size,
                                      widget: inputfield(size, 'Partner id',
                                          'partner id', false),
                                      width: size.width * 0.75,
                                      rad: 50,
                                    ),
                                    SizedBox(height: 16),
                                    GradientBoarder(
                                      size: size,
                                      widget: inputfield(size, 'Doctor id',
                                          'doctor id', false),
                                      width: size.width * 0.75,
                                      rad: 50,
                                    ),
                                  ],
                                )
                              : Center(
                                  child: GradientBoarder(
                                    size: size,
                                    widget: inputfield(size, 'Speciality',
                                        'speciality', false),
                                    width: size.width * 0.75,
                                    rad: 50,
                                  ),
                                ),
                    ),
                  ),
                ),
                Button(
                  size: size,
                  text: 'Sign Up',
                ),
                SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
