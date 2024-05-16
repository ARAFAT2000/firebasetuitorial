

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils{
  
  
  void toastmassege(String messege){
    Fluttertoast.showToast(
        msg: messege,
      fontSize: 16,
      textColor: Colors.white
    );
  }
}