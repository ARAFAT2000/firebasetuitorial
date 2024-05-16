import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetuitorial/Screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(' Flutter'),
        actions: [
          IconButton(
              onPressed: (){
                _auth.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Tuitorial'),
      ),
    );
  }
}
