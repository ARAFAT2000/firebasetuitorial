import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FetchPage extends StatefulWidget {
  const FetchPage({super.key});

  @override
  State<FetchPage> createState() => _FetchPageState();
}

class _FetchPageState extends State<FetchPage> {



  final ref=FirebaseDatabase.instance.ref().child('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Display Realtime Database'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context,snapshot,animation,index){
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('Id').value.toString()),

                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

}