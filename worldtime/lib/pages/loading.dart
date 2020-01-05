import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/data.dart';
import 'package:worldtime/pages/pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
//  SharedPreferences pref = await SharedPreferencesHelper.getPrefs();


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

// http://worldtimeapi.org/api/timezone/Asia/Tokyo

class _LoadingState extends State<Loading> {
  String time = 'loading..';

  // hard coded, but should figure out default for user
  // and load the right default ?
  setWorldTime() async {
    List<WorldTime> locations = AppData().locations;
    for (WorldTime location in locations) {
      await location.getTime();
      print("post $location");
    }

    await SharedPreferencesHelper.init();
    int index = SharedPreferencesHelper.getTimezoneIndex();
    print ('got default pref tz $index');

    Navigator.pushReplacementNamed(context, '/home', arguments: {'pageIndex': index });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 50.0,
          )
        )
    );
  }
}
