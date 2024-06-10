import 'package:flutter/material.dart';


class RoundButtonF extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final loading;
  RoundButtonF({super.key,required this.title,required this.onTap,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: loading ? CircularProgressIndicator(strokeWidth: 2,color: Colors.white,):Text(title,style: TextStyle(
              color: Colors.white
          ),),
        ),

      ),
    );
  }
}
