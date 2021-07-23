import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/providers/navbar_provider.dart';

import '../themes.dart';
import 'GradientBox.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      child: Stack(
        children: [
          GradientBox(
            size: size.height * 0.07,
            radius: 0,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Consumer<NavBarProvider>(
                    builder: (context, value, child) {
                      return InkWell(
                        onTap: () => value.setCIndex(0),
                        child: Container(
                          child: SvgPicture.asset(
                            'assets/images/Group.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Consumer<NavBarProvider>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () => value.setCIndex(1),
                      child: Container(
                        width: size.width * 0.29,
                        height: size.height * 0.07 * 0.6,
                        decoration: BoxDecoration(
                          color: AppColors.cWhite,
                          borderRadius: BorderRadius.all(Radius.circular(39.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            'assets/images/home.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Consumer<NavBarProvider>(
                      builder: (context, value, child) {
                    return InkWell(
                      onTap: () => value.setCIndex(2),
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/images/settings.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
