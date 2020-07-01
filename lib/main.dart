import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pallimart/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors/colors.dart';
void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  String token=await getAccessToken();*/
  runApp(MyApp());
}
Future<String> getAccessToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token') ?? 'token';
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColor.themeColor
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}



