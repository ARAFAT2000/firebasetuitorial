import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasetuitorial/Utils/round_button.dart';
import 'package:firebasetuitorial/Utils/tost_message.dart';
import 'package:firebasetuitorial/realtime_database/realtime_fetch_page.dart';
import 'package:flutter/material.dart';

class RealtimeWrite extends StatefulWidget {
  const RealtimeWrite({super.key});

  @override
  State<RealtimeWrite> createState() => _RealtimeWriteState();
}

class _RealtimeWriteState extends State<RealtimeWrite> {
  final titleController= TextEditingController();

  final referace=FirebaseDatabase.instance.ref().child('Post');
  bool loading=false;
  final _key= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,

        title: Text('Write Screen'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 12,right: 12),
        child: Form(
          key: _key,
          child: Column(
            children: [
                TextFormField(
                  controller: titleController,
                  maxLines: 4,
                  decoration:InputDecoration(
                    hintText: 'title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ) ,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter title';
                    }
                    return null;
                  },
                ),
              SizedBox(
                height: size.height/15,
              ),
             RoundButton(
               loading: loading,
                 title: 'Submit',
                 onTap: (){
                 if(_key.currentState!.validate()){
                   setState(() {
                     loading=true;
                   });


                   String id= DateTime.now().millisecondsSinceEpoch.toString();
                   Map<String,dynamic> Information={
                     'title':titleController.text.toString(),
                     'Id':id
                   };
                   //referace.push(). ---
                   referace.push().set(Information)
                       .then((value) {
                     setState(() {
                       loading=false;
                     });
                     titleController.clear();
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>FetchPage()));
                   }).onError((error, stackTrace) {
                     Utils().toastmassege(error.toString());
                     setState(() {
                       loading=false;
                     });
                   });

                 }
                 })

            ],
          ),
        ),
      ),
    );
  }
}
