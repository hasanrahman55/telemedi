import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/blog/blog_screen.dart';

import 'screen/home_screen.dart';
import 'screen/p_calculator.dart';
import 'screen/signIn_screen.dart';
import 'service/authentication.dart';
import 'widget/pregtime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return MaterialApp(
      routes: {
        BlogScreen.routeName: (context) => const BlogScreen(),
      },
      onGenerateRoute: (Settings) {
        var page;
        var routeName = Settings.name;
        switch (routeName) {
          case PregnancyDueDate.routeName:
            page = PregnancyDueDate();
            break;
          case PregnancyTime.routeName:
            page = PregnancyTime(text: Settings.arguments);
            break;
        }
        return MaterialPageRoute(builder: (context) => page);
      },
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text("Erorr")));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Root();
          }
          return Scaffold(body: Center(child: Text("loding")));
        },
      ),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.uid == null) {
            return SignIn();
          } else {
            return HomePage();
          }
        } else {
          return Scaffold(body: Center(child: Text("loding..")));
        }
      },
    );
  }
}
