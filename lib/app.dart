import 'package:firebasetuitorial/realtime_database/realtime_fetch_page.dart';
import 'package:firebasetuitorial/realtime_database/write_page.dart';
import 'package:flutter/material.dart';

import 'Cloud_database/write_data.dart';
import 'Page/home_page.dart';
import 'Screen/sign_up_screen.dart';
import 'Screen/splass_screen.dart';

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
      home:CloudFirestoreWrite(),
    );
  }
}