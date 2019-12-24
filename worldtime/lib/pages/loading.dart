import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

// http://worldtimeapi.org/api/timezone/America/New_York
// http://worldtimeapi.org/api/timezone/Europe/London
// http://worldtimeapi.org/api/timezone/Asia/Tokyo

class _LoadingState extends State<Loading> {
  String time = 'loading..';

  // hard coded, but should figure out default for user
  // and load the right default ?
  void setWorldTime() async {
    WorldTime wt = WorldTime(location:'Tokyo', flag:'day.jpg', url:'Asia/Tokyo');
    await wt.getTime();
    print('the time ${wt.time}');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': wt.time,
      'location': wt.location,
      'flag': wt.flag,
      'isDaytime': wt.isDaytime,
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
