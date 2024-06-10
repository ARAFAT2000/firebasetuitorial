import 'package:firebasetuitorial/Chat_app/Services/services.dart';
import 'package:firebasetuitorial/Chat_app/screen/login_screen.dart';
import 'package:firebasetuitorial/Chat_app/widget/round_botton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Succesfully log in '),
        RoundButton(
        title: 'Log Out',
        onpress: ()async{
          await AuthServices().logOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>LoginScreen()));
    })
          ],
        ),
      ),
    );
  }
}
