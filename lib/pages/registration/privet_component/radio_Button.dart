import 'package:flutter/material.dart';

import '../../../themes.dart';

enum SingingCharacter { remember, notselect }

/// This is the stateful widget that the main application instantiates.
class RadioText extends StatefulWidget {
  const RadioText({Key key}) : super(key: key);

  @override
  _RadioTextState createState() => _RadioTextState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioTextState extends State<RadioText> {
  int _selectedvalue;
  @override
  void initState() {
    super.initState();
    _selectedvalue = 0;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          width: 35,
          child: Radio(
            value: 1,
            activeColor: AppColors.clightGreen,
            groupValue: _selectedvalue,
            onChanged: (value) {
              setState(() {
                _selectedvalue = value;
              });
            },
          ),
        ),
        Text(
          'Partner',
          style: AppFonts.forgot.copyWith(color: AppColors.cblack),
        ),
      ],
    );
  }
}

//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         'Remember me',
//         style: AppFonts.forgot.copyWith(color: AppColors.cblack),
//       ),
//       leading: Radio(
//         value: 1,
//         activeColor: AppColors.clightGreen,
//         groupValue: _selectedvalue,
//         onChanged: (value) {
//           setState(() {
//             _selectedvalue = value;
//           });
//         },
//       ),
//     );
//   }
// }
