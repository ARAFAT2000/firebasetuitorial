


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetuitorial/Screen/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/sign_in_screen.dart';

class Services{

  void isLogged(BuildContext context){
    FirebaseAuth _auth= FirebaseAuth.instance;

    final user=_auth.currentUser;
    if(user !=null){
      Timer(Duration(seconds: 3), ()=>

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (contex)=>SignInScreen()), (route) => false)
      );
    }else{

      Timer(Duration(seconds: 3), ()=>

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (contex)=>SignUpScreen()), (route) => false)
      );
    }



  }



}





