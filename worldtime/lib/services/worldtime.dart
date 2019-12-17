import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;  // the location part of url
  String time;      // time in location
  String flag;      // url to asset icon
  String url;       // url location end path

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(datetime);
      print(offset);

      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);
      this.time = DateFormat.jm().format(now);
    }
    catch (e) {
      print(e);
      this.time = 'error on fetch ${e}';
    }
  }
}

WorldTime wt = WorldTime(location:'Germany', flag:'germany.png', url:'Europe/Berlin');

