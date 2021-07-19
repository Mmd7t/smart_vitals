import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/NavBar.dart';

import '../../themes.dart';

class MedicationHistory extends StatefulWidget {
  @override
  _MedicationHistoryState createState() => _MedicationHistoryState();
}

class _MedicationHistoryState extends State<MedicationHistory> {
  // _PatientsState createState() => _PatientsState();
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('add medication'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {},
                elevation: 5.0,
                child: Text('Add'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: NavBar(
        size: size,
      ),
      body: Column(
        children: [
          Container(
            height: (size.height / 8) + 10,
            child: Stack(
              children: [
                GradientBox(
                  size: size.height / 8,
                  radius: 56.0,
                ),
                Positioned(
                  top: size.height / 13,
                  left: size.width * 0.08,
                  child: Text(
                    'My Medications', //get username from backend ex:sondos
                    style:
                        AppFonts.buttonText.copyWith(color: AppColors.cWhite),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text('Medication 1'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('dose'),
                          Text('repeats'),
                          Text('start'),
                          Text('end'),
                          Text('notes'),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  );
                },
                itemCount: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
