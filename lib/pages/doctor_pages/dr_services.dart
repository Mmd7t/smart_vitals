import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:smart_vitans/pages/common_pages/pmedication_page.dart';
import 'package:smart_vitans/pages/history/Illness_history_page.dart';
import 'package:smart_vitans/pages/history/medication_history.dart';
import 'package:smart_vitans/pages/history/scans_history_page.dart';
import 'package:smart_vitans/pages/patient_pages/components/BoxButton.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import '../../themes.dart';

class DrServicies extends StatefulWidget {
  @override
  _DrServiciesState createState() => _DrServiciesState();
}

class _DrServiciesState extends State<DrServicies> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List buttons = [
      ['Medication reminder', 'alarm', PMedication()],
      ['my scans & diagnosis history', 'scanner', ScansNDiagnosis()],
      ['my medication history', 'prescription', MedicationHistory()],
      ['my illness history', 'parchment', IllnessHistory()],
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FA),
      body: Column(
        children: [
          Container(
            height: (size.height / 8),
            child: Stack(
              children: [
                GradientBox(
                  size: size.height / 8,
                  radius: 50.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'additional servecies',
                      style:
                          AppFonts.buttonText.copyWith(color: AppColors.cWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientBoarder(
                  widget: BoxButton(
                    size: size,
                    buttom: buttons[0],
                    width: size.width * 0.7,
                    height: size.width * 0.3,
                  ),
                  width: size.width * 0.7,
                  height: size.width * 0.3,
                  rad: 30,
                  size: size,
                  offesetX: 3,
                  offesetY: 3,
                  blur: 5,
                ),
                const SizedBox(height: 10),
                GradientBoarder(
                  widget: BoxButton(
                    size: size,
                    buttom: buttons[1],
                    width: size.width * 0.7,
                    height: size.width * 0.3,
                  ),
                  width: size.width * 0.7,
                  height: size.width * 0.3,
                  rad: 30,
                  size: size,
                  offesetX: 3,
                  offesetY: 3,
                  blur: 5,
                ),
                const SizedBox(height: 10),
                GradientBoarder(
                  widget: BoxButton(
                    size: size,
                    buttom: buttons[2],
                    width: size.width * 0.7,
                    height: size.width * 0.3,
                  ),
                  width: size.width * 0.7,
                  height: size.width * 0.3,
                  rad: 30,
                  size: size,
                  offesetX: 3,
                  offesetY: 3,
                  blur: 5,
                ),
                const SizedBox(height: 10),
                GradientBoarder(
                  widget: BoxButton(
                    size: size,
                    buttom: buttons[3],
                    width: size.width * 0.7,
                    height: size.width * 0.3,
                  ),
                  width: size.width * 0.7,
                  height: size.width * 0.3,
                  rad: 30,
                  size: size,
                  offesetX: 3,
                  offesetY: 3,
                  blur: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
