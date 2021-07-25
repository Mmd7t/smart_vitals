import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/get_medicine_model.dart';
import 'package:smart_vitans/models/medicine_model.dart';
import 'package:smart_vitans/services/get_data_services.dart';
import 'package:smart_vitans/services/read_data_services.dart';
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
    TextEditingController nameController = TextEditingController();
    TextEditingController doseController = TextEditingController();
    TextEditingController repeatsController = TextEditingController();
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
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: doseController,
                    decoration: InputDecoration(hintText: 'Dose'),
                  ),
                  TextField(
                    controller: repeatsController,
                    decoration: InputDecoration(hintText: 'Repeats'),
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
                  ReadDataServices.medicineCreate(MedicineCreate(
                    name: nameController.text.toString(),
                    dose: int.parse(doseController.text.toString()),
                    timesPerDay: int.parse(repeatsController.text.toString()),
                    start: startController.text.toString(),
                    end: endController.text.toString(),
                    desc: notesController.text.toString(),
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
            height: (size.height / 8) + 10,
            child: Stack(
              children: [
                GradientBox(size: size.height / 8, radius: 56.0),
                Positioned(
                  top: size.height / 13,
                  left: size.width * 0.08,
                  child: Text(
                    'My Medications', //get username from backend ex:sondos
                    style:
                        AppFonts.buttonText.copyWith(color: AppColors.cWhite),
                  ),
                ),
                Positioned(
                  top: size.height / 13,
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
            child: FutureBuilder<MedicineListModel>(
              future: GetDateServices.getMedicineList(Constants.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text('${snapshot.data.response[index].name}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${snapshot.data.response[index].dose}'),
                              Text(
                                  '${snapshot.data.response[index].timesPerDay}'),
                              Text('${snapshot.data.response[index].start}'),
                              Text('${snapshot.data.response[index].end}'),
                              Text('${snapshot.data.response[index].desc}'),
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
