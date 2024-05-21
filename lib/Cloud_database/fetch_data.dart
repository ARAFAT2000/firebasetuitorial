

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FetchDatabase extends StatefulWidget {
  const FetchDatabase({super.key});

  @override
  State<FetchDatabase> createState() => _FetchDatabaseState();
}

class _FetchDatabaseState extends State<FetchDatabase> {
  final editController= TextEditingController();
  final database= FirebaseFirestore.instance.collection('userdata').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Display data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: database,
          builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(snapshot.connectionState ==ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        leading: IconButton(
                            onPressed: (){
                           deleteData(snapshot.data!.docs[index]['id']);
                            },
                            icon: Icon(Icons.delete)),
                        title: Text(snapshot.data!.docs[index]['title']),
                        subtitle: Text(snapshot.data!.docs[index]['id']),
                        trailing: IconButton(onPressed: (){
                          updatedatabase(snapshot.data!.docs[index]['title'], snapshot.data!.docs[index]['id']);
                        }, icon: Icon(Icons.edit)),
                      ),
                    );
                  });
            }
           else{
             return Text('Error');
            }
          }),
    );
  }

  Future<void>updatedatabase(String titles,String id)async{
    editController.text=titles;
        return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Update'),
                content: Container(
                  child: TextField(
                    controller: editController,
                  ),
                ),
                actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
                  TextButton(onPressed: ()async{
                 await FirebaseFirestore
                     .instance
                     .collection('userdata').doc(id).update({
                   'title':editController.text.toString()
                 });
                 Navigator.pop(context);
                  }, child: Text('Save')),
                ],
              );
            });
  }

  Future<void>deleteData(String id)async{

    await FirebaseFirestore.instance.collection('userdata').doc(id).delete();
  }
}
