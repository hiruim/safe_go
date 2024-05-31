import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRepository {
  FirebaseDatabase instance = FirebaseDatabase.instance;

  get name => null;

  savedriver({
    required bool isBus,
    required String email,
    required String password,
    required String NIC,
    required String address,
    required String engineNumber,
    required String mobile,
    required String vehicalNumber,
    required String imageUrl,
    required String name,
  }) async {
    bool isDriverSet = await setdriver(
      name: name,
      email: email,
      password: password,
      isBus: isBus,
      NIC: NIC,
      address: address,
      engineNumber: engineNumber,
      mobile: mobile,
      vehicalNumber: vehicalNumber,
      imageUrl: imageUrl,
    );

    if (isDriverSet == true) {
      try {
        await instance.ref("driver").set({
          "name": name.toString(),
          "isBus": isBus,
          "email": email.toString(),
          "password": password.toString(),
          "NIC": NIC.toString(),
          "address": address.toString(),
          "engineNumber": engineNumber.toString(),
          "mobile": mobile.toString(),
          "vehicalNumber": vehicalNumber.toString(),
          "imageUrl": imageUrl.toString(),
        }).then((value) {
          print("value.toString()");
        }).onError((error, stackTrace) {
          print(error.toString());
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("signup failed");
    }
  }

  Future<bool> setdriver({
    required String name,
    required bool isBus,
    required String email,
    required String password,
    required String NIC,
    required String address,
    required String engineNumber,
    required String mobile,
    required String vehicalNumber,
    required String imageUrl,
  }) async {
    try {
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  saveStudent({
    required String Address,
    required Age,
    required String Distance_from_School,
    required String Guardian_Email,
    required String Guardian_Name,
    required String Medical_Status,
    required String NIC,
    required String SName,
    required String School,
    required imageUrl,
    required String mobile,
    required String password,
  }) async {
    bool isStudentSet = await setStudent(
      Age: Age,
      Distance_from_School: Distance_from_School,
      Guardian_Email: Guardian_Email,
      password: password,
      NIC: NIC,
      Address: Address,
      Guardian_Name: Guardian_Name,
      Medical_Status: Medical_Status,
      SName: SName,
      School: School,
      imageUrl: imageUrl,
      mobile: mobile,
    );

    if (isStudentSet == true) {
      try {
        await instance.ref("Student").set({
          "Address": Address.toString(),
          "Age": Age.toString(),
          "Distance_from_School": Distance_from_School.toString(),
          "Guardian_Email": Guardian_Email.toString(),
          "Guardian_Name": Guardian_Name.toString(),
          "Medical_Status": Medical_Status.toString(),
          "School": School.toString(),
          "imageUrl": imageUrl.toString(),
          "mobile": mobile.toString(),
          "password": password.toString(),
          "SName": SName.toString(),
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("signup failed");
    }
  }

  Future<bool> setStudent({
    required String Address,
    required Age,
    required String Distance_from_School,
    required String Guardian_Email,
    required String Guardian_Name,
    required String Medical_Status,
    required String NIC,
    required String SName,
    required String School,
    required imageUrl,
    required String mobile,
    required String password,
  }) async {
    try {
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}
