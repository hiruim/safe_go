import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  List<String> events = ["Event 1", "Event 2", "Event 3"];
  TextEditingController _eventsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _eventsController.text = events.join('\n');
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });

    // Example: Display events for the selected day
    displayEventsForSelectedDay(day);
  }

  void displayEventsForSelectedDay(DateTime day) {
    // Example: Get events for the selected day from your data source
    List<String> eventsForSelectedDay = getEventsForDay(day);

    _eventsController.text = eventsForSelectedDay.join('\n');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Events for ${_formatDateWithoutTime(day)}"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selected Day = " + day.toString().split(" ")[0]),
              SizedBox(height: 10),
              // Display events in a TextField for editing
              TextField(
                controller: _eventsController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(labelText: 'Edit Events'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Save the edited events to your data source
                await saveEditedEvents(_eventsController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  List<String> getEventsForDay(DateTime day) {
    // Example: Fetch events for the selected day from your data source
    // You can replace this with your logic to get events for the day.
    return events;
  }

  Future<void> saveEditedEvents(String editedEvents) async {
    // Get the document directory using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String filePath = '${documentsDirectory.path}/events.txt';

    // Write the edited events to a file
    File file = File(filePath);
    await file.writeAsString(editedEvents);

    print("Saved events to file: $filePath");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        backgroundColor: Colors.yellow,
      ),
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Selected Day = " + today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          ),
        ],
      ),
    );
  }

  bool isSameDay(dynamic day, DateTime today) {
    return day.year == today.year &&
        day.month == today.month &&
        day.day == today.day;
  }

  String _formatDateWithoutTime(DateTime date) {
    return "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}";
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
