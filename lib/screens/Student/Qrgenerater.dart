import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({Key? key}) : super(key: key);

  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  String name = '';
  int age = 0;
  String photoUrl = '';
  String childrenId = '';
// Added to store picked file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Age'),
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              "Add your Child's photo",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 104, 104, 104),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    // Store the photo URL if needed
                    photoUrl = pickedFile.path;
                  });
                }
              },
              child: Text('Add Photo'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Children ID'),
              onChanged: (value) {
                setState(() {
                  childrenId = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Generate QR code logic here
                String data =
                    'Name: $name\nAge: $age\nPhoto URL: $photoUrl\nChildren ID: $childrenId';

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('QR Code'),
                      content: Container(
                        width: 200,
                        height: 200,
                        child: QrImageView(
                          data: data,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
