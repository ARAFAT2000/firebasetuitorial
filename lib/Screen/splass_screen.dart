import 'package:flutter/material.dart';


class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('Splass Screen',
              style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 16
            ),))
          ],
        ),
    );
  }
}
