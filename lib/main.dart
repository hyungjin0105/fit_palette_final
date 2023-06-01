import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

import 'package:fit_palette2/Auth/Auth_service.dart';
import 'package:fit_palette2/Page/Home/MyWeight.dart';
import 'package:fit_palette2/Page/Home/Home.dart';
import 'package:fit_palette2/Page/Home/Profile.dart';
import 'package:fit_palette2/Page/Home/Routine.dart';


import 'package:fit_palette2/Page/Join/join1.dart';
import 'package:fit_palette2/Page/Join/join2.dart';
import 'package:fit_palette2/Page/Join/join3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes : {
        '/MyWeight': (context) => MyWeight(),
        '/Profile': (context) => Profile(),
        '/Routine' :(context) => Routine(),
        '/Home' : (context) => Home(),
        '/join1' : (context) => Join1Page(), 
        '/join2' : (context) => Join2Page(), 
        '/join3' : (context) => Join3Page() 
  },
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuthState(), // 로그인 유무 확인
    );
  }
}