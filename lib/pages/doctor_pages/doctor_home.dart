import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_vitans/constants.dart';
import 'package:smart_vitans/models/user_profile_model.dart';
import 'package:smart_vitans/services/profile_service.dart';
import 'package:smart_vitans/widgets/GradientBox.dart';
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
                      'My patients', //get username from backend ex:sondos
                      style:
                          AppFonts.buttonText.copyWith(color: AppColors.cWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<UserProfileModel>(
                future: ProfileService.profile(Constants.userId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              onTap: () {},
                              title: Text('patient1'),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('spo2    =>    20'),
                                    Text('hr    =>    20'),
                                    Text('sys    =>    30'),
                                    Text('dia    =>    40'),
                                    Text('sug    =>   50'),
                                  ],
                                ),
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
                    );
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DrServicies()));
        },
        child: const Icon(Icons.home_repair_service, color: Colors.white),
      ),
    );
  }
}
