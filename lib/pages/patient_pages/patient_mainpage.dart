import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/pages/patient_pages/patient_home.dart';
import 'package:smart_vitans/pages/setting.dart';
import 'package:smart_vitans/providers/navbar_provider.dart';
import 'package:smart_vitans/widgets/NavBar.dart';

import 'patient_profile.dart';

class PatientMainPage extends StatefulWidget {
  const PatientMainPage({Key key}) : super(key: key);

  @override
  _PatientMainPageState createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  List<Widget> pages = [PatientProfile(), PatientHome(), Setting()];

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
