import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_screen/login.dart';
import 'package:login_screen/otp.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String uid;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'profile': (context) => Profile(),
      },
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   uid = FirebaseAuth.instance.currentUser.uid;
  // }
}
