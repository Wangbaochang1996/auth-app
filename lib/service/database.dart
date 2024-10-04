import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("employee").snapshots();
  }
}
