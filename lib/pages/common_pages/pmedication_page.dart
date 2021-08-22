import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import '../../themes.dart';

class PMedication extends StatefulWidget {
  @override
  _PMedicationState createState() => _PMedicationState();
}

class _PMedicationState extends State<PMedication> {
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
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                GradientBox(size: size.height / 8, radius: 50.0),
                SafeArea(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'My Medications', //get username from backend ex:sondos
                        style: AppFonts.buttonText
                            .copyWith(color: AppColors.cWhite),
                      ),
                    ),
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
                      title: Text('medication 1'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('time'),
                          Text('repeats'),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  );
                },
                itemCount: 15),
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
