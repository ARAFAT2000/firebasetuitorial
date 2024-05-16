import 'dart:developer';

import 'package:firebasetuitorial/Services/services.dart';
import 'package:flutter/material.dart';


class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {

 Services _services = Services();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _services.isLogged(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Center(child: Text('Splass Screen'))
             ],
           ),
    );
  }
}
