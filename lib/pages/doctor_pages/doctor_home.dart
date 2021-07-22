import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
import 'package:smart_vitans/widgets/NavBar.dart';

import '../../themes.dart';
import 'dr_services.dart';

class DoctorHome extends StatefulWidget {
  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  // _PatientsState createState() => _PatientsState();
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('enter patient id'),
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
                    'My patients', //get username from backend ex:sondos
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
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text('patient1'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('spo2'),
                          Text('hr'),
                          Text('sys'),
                          Text('dia'),
                          Text('sug'),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DrServicies()));
        },
        child: const Icon(Icons.home_repair_service),
      ),
    );
  }
}
