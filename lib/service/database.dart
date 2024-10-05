import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //Create
  Future addUser(String userId, Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInfoMap);
  }

  //Create
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  //Read
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("employee").snapshots();
  }

  //Update
  Future updateEmployeeDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("employee")
        .doc(id)
        .update(updateInfo);
  }

  //delete
  Future deleteEmployeeDetails(
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("employee")
        .doc(id)
        .delete();
  }
}
