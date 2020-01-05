import 'package:worldtime/services/worldtime.dart';
import 'package:worldtime/pages/pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static final AppData _appData = new AppData._internal();

  List<WorldTime> locations = [
    WorldTime(location:'Berlin', flag:'flag1.jpg', url:'Europe/Berlin', image:'Niseko_BC_01.jpg'),
    WorldTime(location:'Tokyo', flag:'day.jpg', url:'Asia/Tokyo', image:'Niseko_BC_02.jpg'),
    WorldTime(location:'Charlotte', flag:'flag2.jpg', url:'America/New_York', image:'Niseko_BC_03.jpg'),
    WorldTime(location:'Los Angeles', flag:'night.jpg', url:'America/Los_Angeles', image:'Niseko_BC_04.jpg'),
    WorldTime(location:'Honolulu', flag:'day.jpg', url:'Pacific/Honolulu', image:'Niseko_BC_11.jpg'),
    WorldTime(location:'Sydney', flag:'flag3.jpg', url:'Australia/Sydney', image:'Niseko_BC_05.jpg'),
    WorldTime(location:'Karachi', flag:'day.jpg', url:'Asia/Karachi', image:'Niseko_BC_06.jpg'),
    WorldTime(location:'North Korea', flag:'flag3.jpg', url:'Asia/Pyongyang', image:'Niseko_BC_07.jpg'),
    WorldTime(location:'China', flag:'day.jpg', url:'Asia/Shanghai', image:'Niseko_BC_08.jpg'),
    WorldTime(location:'Moscow', flag:'night.jpg', url:'Europe/Moscow', image:'Niseko_BC_09.jpg'),
    WorldTime(location:'Canary Island', flag:'flag2.jpg', url:'Atlantic/Canary', image:'Niseko_BC_10.jpg'),
  ];

  factory AppData()  {
    return _appData;
  }
  AppData._internal();
}

final appData = AppData();
