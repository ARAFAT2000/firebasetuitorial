import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  String text;
  final VoidCallback onTap;
  double height,weight;

  RoundButton({required this.text,
               required this.onTap,
              required this.height,
             required this.weight
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child:Container(
        height: height,
        width: weight,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: Text(text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),)),
      ) ,
    );
  }
}
