import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/responsive/mobile_layout.dart';
import 'package:insta_clone/responsive/responsive_layout.dart';
import 'package:insta_clone/responsive/web_layout.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/views/login_screen.dart';
import 'package:insta_clone/views/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDj5zzL-YKB6n5YlKn4OxVANsNsJClb-Og',
          appId: '1:55410437694:web:033cd10e0497714a02ab6f',
          messagingSenderId: '55410437694',
          projectId: 'insta-clone-96feb',
          storageBucket: 'insta-clone-96feb.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone in Flutter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayout(),
      //   webScreenLayout: WebLayout(),
      //),
      home: const SignupScreen(),
    );
  }
}
