import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location:'Berlin', flag:'flag1.jpg', url:'Europe/Berlin'),
    WorldTime(location:'Tokyo', flag:'day.jpg', url:'Asia/Tokyo'),
    WorldTime(location:'Charlotte', flag:'flag2.jpg', url:'America/New_York'),
    WorldTime(location:'Los Angeles', flag:'night.jpg', url:'America/Los_Angeles'),
    WorldTime(location:'Sydney', flag:'flag3.jpg', url:'Australia/Sydney'),
    WorldTime(location:'Karachi', flag:'day.jpg', url:'Asia/Karachi'),
    WorldTime(location:'North Korea', flag:'flag3.jpg', url:'Asia/Pyongyang'),
    WorldTime(location:'China', flag:'day.jpg', url:'Asia/Shanghai'),
  ];

  // how to save default state
  int defaultState = 1;

  // pops to the front page?
  void updateTime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context, {
      'time': wt.time,
      'location': wt.location,
      'flag': wt.flag,
      'isDaytime': wt.isDaytime,
    });
  }

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
              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
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
