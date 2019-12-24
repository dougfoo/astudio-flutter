import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _languages = <String>['de','en','es','fr','it','nl','pt'];

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
      body: Builder(  // wrap in builder to get scaffold context for popup ?
          builder: (BuildContext context) {
            return Container(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (BuildContext context, int index) {
                  String foo;

                  return ListTile(
                    title: _buildFlag(_languages[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () async {
                        // Save the user preference
                        await SharedPreferencesHelper.setLanguageCode(
                            _languages[index]
                        );
                        showDialog(
                            context: context,
                            builder: (context) {
                              TextEditingController cController = TextEditingController();
                              return AlertDialog(
                                title: Text('PrefSelected'),
                                content: TextField(
                                  controller: cController,
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    elevation: 5.0,
                                    color: Colors.blue,
                                    child: Text('Save'),
                                    onPressed: () {
                                      print('click pop');
                                      foo = cController.text.toString();
//                                      Navigator.of(context).pop(
//                                          cController.text.toString());
                                      print('Hello $foo');

                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text('Hello $foo')
                                          ));
                                    },
                                  )
                                ],
                              );
                            }
                        ); // showDialog
                        // Refresh
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            );
          }),
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
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kLanguageCode = "language";

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLanguageCode) ?? 'en';
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLanguageCode, value);
  }
}
