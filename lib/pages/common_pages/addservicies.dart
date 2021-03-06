import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:smart_vitans/pages/history/Illness_history_page.dart';
import 'package:smart_vitans/pages/history/medication_history.dart';
import 'package:smart_vitans/pages/history/scans_history_page.dart';
import 'package:smart_vitans/pages/patient_pages/components/BoxButton.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/Gradient_border.dart';
import 'package:smart_vitans/widgets/NavBar.dart';

import '../../themes.dart';
import 'pmedication_page.dart';

class AddServicies extends StatefulWidget {
  final int type;

  const AddServicies({Key key, this.type}) : super(key: key);
  @override
  _AddServiciesState createState() => _AddServiciesState();
}

class _AddServiciesState extends State<AddServicies> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List buttons = [
      ['Medication reminder', 'alarm', PMedication()],
      [
        (widget.type == 0)
            ? 'Patient scans & diagnosis history'
            : 'my scans & diagnosis history',
        'scanner',
        ScansNDiagnosis()
      ],
      [
        (widget.type == 0)
            ? 'Patient medication history'
            : 'my medication history',
        'prescription',
        MedicationHistory()
      ],
      [
        (widget.type == 0) ? 'patient history' : 'my illness history',
        'parchment',
        IllnessHistory()
      ],
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FA),
      body: Column(
        children: [
          Container(
            height: (size.height / 8) + 50,
            child: Stack(
              children: [
                GradientBox(
                  size: size.height / 5,
                  radius: 56.0,
                ),
                Positioned(
                  top: size.height / 13,
                  left: size.width * 0.08,
                  child: Text(
                    (widget.type == 0)
                        ? 'Patient History'
                        : 'Additional Servecies',
                    style:
                        AppFonts.buttonText.copyWith(color: AppColors.cWhite,fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
              SizedBox(height: 2,),
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
              SizedBox(height: 2,),
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
              SizedBox(height: 2,),
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
        ],
      ),
    );
  }
}
