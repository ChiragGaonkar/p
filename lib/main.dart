import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightMode = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.grey,
        brightness: isLightMode ? Brightness.light : Brightness.dark,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: isLightMode
                  ? const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              bodyText2: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              subtitle1: const TextStyle(
                fontSize: 15,
                color: Colors.pink,
              ),
              subtitle2: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        SettingScreen.routeName: (ctx) => const SettingScreen(),
      },
    );
  }
}
