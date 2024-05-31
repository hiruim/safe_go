import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_go/screens/Calendar.dart';
import 'package:safe_go/screens/Driver/DriverMessage.dart';
import 'package:safe_go/screens/Driver/PaymentDetails.dart';
//import 'package:safe_go/screens/Driver/QRScanner.dart';
import 'package:safe_go/screens/Driver/StudentsDetails.dart';
import 'package:safe_go/screens/Settings.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const Dhome(),
    );
  }
}

class Dhome extends StatefulWidget {
  const Dhome({Key? key}) : super(key: key);

  @override
  State<Dhome> createState() => _DhomeState();
}

class _DhomeState extends State<Dhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    "Hi Driver,",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  subtitle: Text(
                    "Have A Great Day !!",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/bus4.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                ),
              ),
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
                children: [
                  itemDashboard(
                    "Student Details",
                    CupertinoIcons.person_2_fill,
                    Color.fromARGB(255, 157, 157, 8),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SDetails(),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    "Message",
                    CupertinoIcons.chat_bubble,
                    Color.fromARGB(255, 24, 108, 180),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverMessage(),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    "payment's Details",
                    CupertinoIcons.creditcard,
                    Colors.blueGrey,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDetails(),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    "School Days",
                    CupertinoIcons.calendar,
                    Color.fromARGB(255, 53, 61, 3),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calendar(),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    "Settings",
                    CupertinoIcons.gear_big,
                    const Color.fromARGB(255, 25, 51, 64),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                  ),
                  // itemDashboard(
                  //   "QR scaner",
                  //   CupertinoIcons.qrcode_viewfinder,
                  //   Color.fromARGB(255, 101, 168, 115),
                  //   () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => QrScanner(),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background,
          VoidCallback onTap) =>
      InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 251, 251, 169),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: const Color.fromARGB(255, 250, 243, 178),
                  spreadRadius: 5,
                  blurRadius: 2),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration:
                    BoxDecoration(color: background, shape: BoxShape.circle),
                child: Icon(iconData, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
}
