import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/data.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

// http://worldtimeapi.org/api/timezone/Asia/Tokyo

class _LoadingState extends State<Loading> {
  String time = 'loading..';

  // hard coded, but should figure out default for user
  // and load the right default ?
  void  setWorldTime() async {
    List<WorldTime> locations = AppData().locations;
//    locations.forEach((location)   {
    for (WorldTime location in locations) {
      await location.getTime();
      print("post ${location}");
    }

    WorldTime wt = WorldTime(location:'Tokyo', flag:'day.jpg', url:'Asia/Tokyo', image: 'Niseko_BC_11.jpg');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': locations[0].time,
      'location': locations[0].location,
      'flag': locations[0].flag,
      'isDaytime': locations[0].isDaytime,
    });
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
