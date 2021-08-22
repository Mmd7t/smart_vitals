import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/models/illness_list_model.dart';
import 'package:smart_vitans/models/illness_model.dart';
import 'package:smart_vitans/services/get_data_services.dart';
import 'package:smart_vitans/services/read_data_services.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';

import '../../constants.dart';
import '../../themes.dart';

class IllnessHistory extends StatefulWidget {
  @override
  _IllnessHistoryState createState() => _IllnessHistoryState();
}

class _IllnessHistoryState extends State<IllnessHistory> {
  // _PatientsState createState() => _PatientsState();
  createAlertDialog(BuildContext context) {
    TextEditingController diagnosisController = TextEditingController();
    TextEditingController symptomsController = TextEditingController();
    TextEditingController startController = TextEditingController();
    TextEditingController endController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('add medication'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: diagnosisController,
                    decoration: InputDecoration(hintText: 'Diagnosis'),
                  ),
                  TextField(
                    controller: symptomsController,
                    decoration: InputDecoration(hintText: 'Symptoms'),
                  ),
                  TextField(
                    controller: startController,
                    decoration: InputDecoration(hintText: 'Start Date'),
                  ),
                  TextField(
                    controller: endController,
                    decoration: InputDecoration(hintText: 'End Date'),
                  ),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(hintText: 'Notes'),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  ReadDataServices.illnessCreate(IllnessCreate(
                    diagnoses: diagnosisController.text.toString(),
                    symptoms: symptomsController.text.toString(),
                    start: startController.text.toString(),
                    end: endController.text.toString(),
                    notes: notesController.text.toString(),
                    patientId: Constants.userId,
                  ));
                  Navigator.of(context).pop();
                },
                elevation: 5.0,
                child: const Text('Add'),
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
            height: (size.height / 8) + 50,
            child: Stack(
              children: [
                GradientBox(
                  size: size.height / 5,
                  radius: 56.0,
                ),
                Positioned(
                  top: size.height / 10,
                  left: size.width * 0.15,
                  child: Text(
                    'My Illness History', //get username from backend ex:sondos
                    style:
                        AppFonts.buttonText.copyWith(color: AppColors.cWhite),
                  ),
                ),
                Positioned(
                  top: size.height / 11,
                  right: size.width * 0.08,
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh)),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<IllnessListModel>(
              future: GetDateServices.getIllnessList(Constants.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                              '${snapshot.data.response[index].diagnoses}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${snapshot.data.response[index].symptoms}'),
                              Text('${snapshot.data.response[index].start}'),
                              Text('${snapshot.data.response[index].end}'),
                              Text('${snapshot.data.response[index].notes}'),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data.response.length,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
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
