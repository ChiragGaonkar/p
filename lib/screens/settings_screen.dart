import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var darkmode = false;
  var isAndroidView = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode() {
      return darkmode;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            //Since Column and ListView cant be used together we use Expanded Widget
            Expanded(
                child: ListView(
              children: [
                //Switch to change to darkmode
                SwitchListTile(
                  title: const Text(
                    'Darkmode',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: darkmode,
                  onChanged: (newValue) {
                    setState(
                      () {
                        darkmode = newValue;
                      },
                    );
                  },
                ),
                //Switch to change to AndroidView
                SwitchListTile(
                  title: const Text(
                    'Android View',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: isAndroidView,
                  onChanged: (newValue) {
                    setState(
                      () {
                        isAndroidView = newValue;
                      },
                    );
                  },
                )
              ],
            ))
          ],
        ));
  }
}
