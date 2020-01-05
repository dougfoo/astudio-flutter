import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _languages = <String>['de','en','es','fr','it','nl','pt'];

// originally a dummy class to test language prefs
// copied from https://medium.com/flutter-community/shared-preferences-how-to-save-flutter-application-settings-and-user-preferences-for-later-554d08671ae9
// modified to add my location prefs

class Pref extends StatefulWidget {
  @override
  _PrefState createState() => _PrefState();
}

class _PrefState extends State<Pref> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        actions: <Widget>[
          FutureBuilder<String>(
            // get the languageCode, saved in the preferences
              future: SharedPreferencesHelper.getLanguageCode(),
              initialData: 'en',
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return snapshot.hasData
                    ? _buildFlag(snapshot.data)
                    : Container();
              }),
        ],
      ),
      body:  Container(
        child: ListView.builder(
          itemCount: _languages.length,
          itemBuilder: (BuildContext context, int index) {

            return ListTile(
              title: _buildFlag(_languages[index]),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () async {
                  // Save the user preference
                  await SharedPreferencesHelper.setLanguageCode(_languages[index]);
                  // Refresh
                  setState(() {});
                },
              ),
            );
          },
        ),
      )
    );
  }
  // Returns the flag that corresponds to the languageCode
  // Flags are assets, added to the application
  Widget _buildFlag(String languageCode){
    return Text(
      'Lang ${languageCode}',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class SharedPreferencesHelper {
  static SharedPreferences localStorage;
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  static final String _kLanguageCode = "language";
  static final String _kTimezoneCode = "timezone";

  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString(_kLanguageCode);
    print('getLanguage $lang');
    return lang ?? 'en';
  }

  static Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    print('setLanguage $value');
    return prefs.setString(_kLanguageCode, value);
  }

  static int getTimezoneIndex() {
    int pref = localStorage.getInt(_kTimezoneCode);
    print('getTimezone $pref');
    return pref ?? 0;
  }

  static setTimezoneIndex(int value)  {
    print('setTimezone $value');
    localStorage.setInt(_kTimezoneCode, value);
  }
}
