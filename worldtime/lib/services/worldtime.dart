import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;  // the location part of url
  String time = "Loading..";      // time in location
  String flag;      // url to asset icon
  String url;       // url location end path
  bool isDaytime;
  bool isDefault;   // add flag for default ?  one is true?  or add in container
  String image;

  WorldTime({this.location, this.flag, this.url, this.image});

  @override
  String toString() {
    return "WorldTime["+this.location+","+ this.time +"]";
  }

  Future<void> getTime() async {
    try {
//      print('gettime $url');
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];   // bug - not handled
      String offset = data['utc_offset'].substring(0, 3);
//      print(offset);

      DateTime now = DateTime.parse(datetime);
//      print(now);
      now = now.add(Duration(hours: int.parse(offset)));
//      print(now);
      this.time = DateFormat.jm().format(now);
      this.isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch (e) {
      print(e);
      this.time = 'error on fetch ${e}' ;
    }
  }
}


