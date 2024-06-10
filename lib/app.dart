
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetuitorial/Chat_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'Chat_app/screen/login_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
             if(snapshot.hasData){
              return HomeScreen();
             }else{
               return LoginScreen();
             }
          }),
    );
  }
}