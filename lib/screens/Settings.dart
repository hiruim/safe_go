import 'package:flutter/material.dart';
import 'package:safe_go/screens/About.dart';
import 'package:safe_go/screens/Help.dart';
import 'package:safe_go/screens/Language.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Placeholder variables for language and help settings
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language Setting
            ListTile(
              title: Text('Language'),
              subtitle: Text(selectedLanguage),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Language(),
                  ),
                );
                // Open language settings or navigate to language settings page
                // You can implement your logic here
              },
            ),
            // Divider
            Divider(),
            // Help Button
            ListTile(
              title: Text('Help'),
              trailing: Icon(Icons.help),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Help(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              trailing: Icon(Icons.info),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
