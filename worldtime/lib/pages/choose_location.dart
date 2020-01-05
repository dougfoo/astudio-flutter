import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:worldtime/data.dart';
import 'package:worldtime/pages/pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
//  SharedPreferences pref = await SharedPreferencesHelper.getPrefs();

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = AppData().locations;

  // pops to the front page?
  void updateTime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context, {
      'index': index,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title:Text('choose default start'),
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
                  onTap: () async {
                    updateTime(index);
                    SharedPreferencesHelper.setTimezoneIndex(index);
                    print('timezone code is updated async to $index');
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
