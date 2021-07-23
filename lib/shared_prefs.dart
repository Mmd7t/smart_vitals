import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences prefs;

/*-----------------------------------  Initialize Prefs  -----------------------------------*/
  static initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

/*-------------------------------------  save Patient Id  -------------------------------------*/
  static void saveUserTypeToPrefs(userType) async {
    await initPrefs();
    prefs.setInt('userType', userType);
  }

  static Future<int> getUserTypeFromPrefs() async {
    await initPrefs();
    int userType = prefs.getInt('userType');
    return userType;
  }

  static Future removeUserType() async {
    await initPrefs();
    prefs.remove('userType');
  }

/*-------------------------------------  save Id  -------------------------------------*/
  static void saveIdToPrefs(id) async {
    await initPrefs();
    prefs.setInt('id', id);
  }

  static Future<int> getIdFromPrefs() async {
    await initPrefs();
    int id = prefs.getInt('id');
    return id;
  }

  static Future removeId() async {
    await initPrefs();
    prefs.remove('id');
  }

/*-------------------------------------  save Patient Id  -------------------------------------*/
  static void savePatientIdToPrefs(patientId) async {
    await initPrefs();
    prefs.setInt('patientId', patientId);
  }

  static Future<int> getPatientIdFromPrefs() async {
    await initPrefs();
    int patientId = prefs.getInt('patientId');
    return patientId;
  }

  static Future removePatientId() async {
    await initPrefs();
    prefs.remove('patientId');
  }

/*-------------------------------------  save Doctor Id  -------------------------------------*/
  static void saveDoctorIdToPrefs(doctorId) async {
    await initPrefs();
    prefs.setString('doctorId', doctorId);
  }

  static Future<String> getDoctorIdFromPrefs() async {
    await initPrefs();
    String doctorId = prefs.getString('doctorId');
    return doctorId;
  }

  static Future removeDoctorId() async {
    await initPrefs();
    prefs.remove('doctorId');
  }

/*-------------------------------------  save Partner Id  -------------------------------------*/
  static void savePartnerIdToPrefs(partnerId) async {
    await initPrefs();
    prefs.setString('partnerId', partnerId);
  }

  static Future<String> getPartnerIdFromPrefs() async {
    await initPrefs();
    String partnerId = prefs.getString('partnerId');
    return partnerId;
  }

  static Future removePartnerId() async {
    await initPrefs();
    prefs.remove('partnerId');
  }
}
