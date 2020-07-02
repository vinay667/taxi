import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pallimart/screens/home.dart';
import 'package:pallimart/screens/login_screen.dart';
import 'package:pallimart/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors/colors.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token=await prefs.getString('access_token') ?? 'notLogin';
  print(token);
  print(await prefs.getString('name'));
  runApp(MyApp(token));
}
/*Future<String> getAccessToken() async {

  return prefs.getString('access_token') ?? 'token';
}*/
class MyApp extends StatelessWidget {
  String token;
  MyApp(this.token);
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
      home: SplashScreen(token),
      routes: {
        '/home': (BuildContext context) => HomeScreen(),
        '/login': (BuildContext context) => LoginScreen(),
      },
    );
  }
}



