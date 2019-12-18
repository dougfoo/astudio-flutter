import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location:'Berlin', flag:'day.jpg', url:'Europe/Berlin'),
    WorldTime(location:'Tokyo', flag:'day.jpg', url:'Asia/Tokyo'),
    WorldTime(location:'New York', flag:'night.jpg', url:'America/New_York'),
    WorldTime(location:'Los Angeles', flag:'night.jpg', url:'America/Los_Angeles'),
    WorldTime(location:'Sydney', flag:'night.jpg', url:'Australia/Sydney'),
    WorldTime(location:'Perth', flag:'day.jpg', url:'Australia/Perth')
  ];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title:Text('choose location'),
          centerTitle: true,
          elevation: 0, // whats this do drop shadow ??
        ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {

                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/${locations[index].flag}'
                    ),
                  )
                )
              ),
            );
          }
      ),
    );
  }
}
