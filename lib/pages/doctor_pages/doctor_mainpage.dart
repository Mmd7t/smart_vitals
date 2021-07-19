import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/pages/doctor_pages/doctor_home.dart';
import 'package:smart_vitans/pages/setting.dart';
import 'package:smart_vitans/providers/navbar_provider.dart';
import 'package:smart_vitans/widgets/NavBar.dart';

import 'dr.profie_page.dart';

class DoctorMainPage extends StatefulWidget {
  const DoctorMainPage({Key key}) : super(key: key);

  @override
  _DoctorMainPageState createState() => _DoctorMainPageState();
}

class _DoctorMainPageState extends State<DoctorMainPage> {
  List<Widget> pages = [
    DrProfile(),
    DoctorHome(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Selector<NavBarProvider, int>(
      selector: (context, value) => value.cIndex,
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: NavBar(size: size),
          body: pages[value],
        );
      },
    );
  }
}
