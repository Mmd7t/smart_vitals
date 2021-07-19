import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/pages/partner_pages/partner_home.dart';
import 'package:smart_vitans/pages/setting.dart';
import 'package:smart_vitans/providers/navbar_provider.dart';
import 'package:smart_vitans/widgets/NavBar.dart';

import 'pprofile_page.dart';

class PartnerMainPage extends StatefulWidget {
  const PartnerMainPage({Key key}) : super(key: key);

  @override
  _PartnerMainPageState createState() => _PartnerMainPageState();
}

class _PartnerMainPageState extends State<PartnerMainPage> {
  List<Widget> pages = [PProfile(), PartnerHome(), Setting()];

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
