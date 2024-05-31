import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safe_go/screens/Login.dart';

class Signup extends StatefulWidget {
  @override
  _SignageState createState() => _SignageState();
}

class _SignageState extends State<Signup> {
  int selectedValue = 0;
  XFile? _driverPhoto; // Updated to store the selected driver photo
  XFile? _CahildPhoto;
  XFile? _busorvanPhoto; // Updated to store the selected Cahild photo

  TextEditingController? NICController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  TextEditingController? engineNumberController = TextEditingController();
  TextEditingController? mobileController = TextEditingController();
  TextEditingController? vehicalNumberController = TextEditingController();
  TextEditingController? SeatCapacityController = TextEditingController();
  TextEditingController? imageUrlController = TextEditingController();

  TextEditingController? GNICController = TextEditingController();
  TextEditingController? GAgeController = TextEditingController();
  TextEditingController? GnameController = TextEditingController();
  TextEditingController? GDistanceController = TextEditingController();
  TextEditingController? MedicalController = TextEditingController();
  TextEditingController? SNameController = TextEditingController();
  TextEditingController? SchoolController = TextEditingController();
  TextEditingController? gimageUrlController = TextEditingController();
  TextEditingController? GaddressController = TextEditingController();
  TextEditingController? AgeController = TextEditingController();
  TextEditingController? GemailController = TextEditingController();
  TextEditingController? GmobileController = TextEditingController();
  TextEditingController? GPasswordController = TextEditingController();
  TextEditingController? confirmGPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            "Safe_Go",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Driver",
                icon: Icon(
                  Icons.directions_bus,
                  color: Color.fromRGBO(207, 145, 11, 1),
                ),
              ),
              Tab(
                text: "Student",
                icon: Icon(
                  Icons.person,
                  color: Color.fromRGBO(207, 145, 11, 1),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: 5000,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: TabBarView(
            children: [
              tab1(),
              tab2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tab1() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Add your photo",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 104, 104, 104),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                setState(() {
                  _driverPhoto = pickedFile;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: _driverPhoto != null
                  ? Image.file(File(_driverPhoto!.path), fit: BoxFit.cover)
                  : Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
            ),
          ),
          TextFormField(
            maxLength: 20,
            decoration: InputDecoration(hintText: "Driver Name"),
            controller: nameController,
          ),
          TextFormField(
            maxLength: 30,
            decoration: InputDecoration(hintText: "Driver Email"),
            controller: emailController,
          ),
          TextFormField(
              maxLength: 12,
              decoration: InputDecoration(hintText: "N I C"),
              controller: NICController),
          TextFormField(
              maxLength: 10,
              decoration: InputDecoration(hintText: "Phone Number"),
              controller: mobileController),
          TextFormField(
              maxLength: 30,
              decoration: InputDecoration(hintText: "Address"),
              controller: addressController),
          TextFormField(
            maxLength: 8,
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a new password';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          TextFormField(
            maxLength: 8,
            controller: confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != passwordController?.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Radio(
                value: 0,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValue = value!;
                    },
                  );
                },
              ),
              Text('Bus'),
              SizedBox(
                width: 70,
              ),
              Radio(
                value: 1,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValue = value!;
                    },
                  );
                },
              ),
              Text('Van'),
            ],
          ),
          TextFormField(
              maxLength: 10,
              decoration: InputDecoration(hintText: "Vehicle Number"),
              controller: vehicalNumberController),
          TextFormField(
              maxLength: 10,
              decoration: InputDecoration(hintText: "Engine Number"),
              controller: engineNumberController),
          TextFormField(
              decoration: InputDecoration(hintText: "Seat Capacity"),
              controller: SeatCapacityController),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Add your van or bus photo",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 104, 104, 104),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                setState(() {
                  _busorvanPhoto = pickedFile;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: _busorvanPhoto != null
                  ? Image.file(File(_busorvanPhoto!.path), fit: BoxFit.cover)
                  : Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.done_all,
              color: Colors.orange[300],
              size: 30.0,
            ),
            label: Text('Sign in'),
            onPressed: () {
              onClickSignIn();
            },
          ),
        ],
      ),
    );
  }

  Widget tab2() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextFormField(
            maxLength: 20,
            decoration: InputDecoration(hintText: "Guardian Name"),
            controller: nameController,
          ),
          TextFormField(
            controller: GemailController,
            decoration: InputDecoration(
              labelText: 'Guardian Email Address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              // Add your own email validation logic here
              // You can use regex or other methods to validate the email format
              return null;
            },
          ),
          TextFormField(
            controller: GPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a new password';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          TextFormField(
            controller: confirmGPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != GPasswordController?.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          TextFormField(
            maxLength: 12,
            decoration: InputDecoration(hintText: "Phone Number"),
            controller: GmobileController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "N I C"),
            controller: GNICController,
          ),
          TextFormField(
            maxLength: 30,
            decoration: InputDecoration(hintText: "Address"),
            controller: GaddressController,
          ),
          TextFormField(
            maxLength: 10,
            decoration: InputDecoration(hintText: "Student Name"),
            controller: SNameController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Age"),
            controller: GAgeController,
          ),
          TextFormField(
            maxLength: 20,
            decoration: InputDecoration(hintText: "School"),
            controller: SchoolController,
          ),
          TextFormField(
            maxLength: 4,
            decoration: InputDecoration(hintText: "Distance from School (km)"),
            controller: GDistanceController,
          ),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(hintText: "Update Medical Status"),
            controller: MedicalController,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Add your Cahild's photo",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 104, 104, 104),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                setState(() {
                  _CahildPhoto = pickedFile;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: _CahildPhoto != null
                  ? Image.file(File(_CahildPhoto!.path), fit: BoxFit.cover)
                  : Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.done_all,
              color: Colors.orange[300],
              size: 30.0,
            ),
            label: Text('Sign up'),
            onPressed: () {
              _onClickSignin();
            },
          ),
        ],
      ),
    );
  }

  void _onClickSignin() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // ignore: deprecated_member_use
    final databaseReference = FirebaseDatabase.instance.reference();

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: GemailController!.text.trim(),
      password: GPasswordController!.text.toString(),
    );

    if (userCredential.user != null) {
      databaseReference.child('Student').child(userCredential.user!.uid).set({
        'Address': GaddressController!.text.trim(),
        'Age': GAgeController!.text.numericOnly(),
        'Distance_from_School': GDistanceController!.text.numericOnly(),
        'Guardian_Email': GemailController!.text.trim(),
        'Guardian_Name': nameController!.text.trim(),
        'Medical_Status': MedicalController!.text.trim(),
        'NIC': GNICController!.text.toString(),
        'SName': SNameController!.text.trim(),
        'School': SchoolController!.text.trim(),
        'imageUrl': gimageUrlController!.text.trim(),
        'mobile': GmobileController!.text.toString(),
        'password': GPasswordController!.text.toString(),
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void onClickSignIn() async {
    final databaseReference = FirebaseDatabase.instance.reference();

    databaseReference.child('Driver').push().set({
      'NIC': NICController!.text.toString(),
      'address': addressController!.text.toString(),
      'mail': emailController!.text.trim(),
      'engineNumber': engineNumberController!.text.toString(),
      'mobile': mobileController!.text.toString(),
      'name': nameController!.text.trim(),
      'isBus': (selectedValue == 0),
      'password': passwordController!.text.toString(),
      'vehicalNumber': vehicalNumberController!.text.toString(),
      'imageUrl': gimageUrlController!.text.trim(),
    }).then((value) {
      print('Data added successfully!');
    }).catchError((error) {
      print('Failed to add data: $error');
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  // void onClickSignIn() async {
  //   await FirebaseRepository().savedriver(
  //     NIC: NICController!.text.toString(),
  //     address: addressController!.text.toString(),
  //     email: emailController!.text.trim(),
  //     engineNumber: engineNumberController!.text.toString(),
  //     mobile: mobileController!.text.toString(),
  //     name: nameController!.text.trim(),
  //     isBus: (selectedValue == 0),
  //     password: passwordController!.text.toString(),
  //     vehicalNumber: vehicalNumberController!.text.toString(),
  //     imageUrl: gimageUrlController!.text.trim(),
  //   );
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LoginPage(),
  //     ),
  //   );
  // }

  // void _onClickSignin() async {
  //   await FirebaseRepository().saveStudent(
  //     Address: GaddressController!.text.trim(),
  //     Age: GAgeController!.text.numericOnly(),
  //     Distance_from_School: GDistanceController!.text.numericOnly(),
  //     Guardian_Email: GemailController!.text.trim(),
  //     Guardian_Name: nameController!.text.trim(),
  //     Medical_Status: MedicalController!.text.trim(),
  //     NIC: GNICController!.text.toString(),
  //     SName: SNameController!.text.trim(),
  //     School: SchoolController!.text.trim(),
  //     imageUrl: gimageUrlController!.text.trim(),
  //     mobile: GmobileController!.text.toString(),
  //     password: GPasswordController!.text.toString(),
  //   );
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LoginPage(),
  //     ),
  //   );
  // }
}
