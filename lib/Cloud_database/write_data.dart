
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetuitorial/Utils/round_button.dart';
import 'package:firebasetuitorial/Utils/tost_message.dart';

import 'package:flutter/material.dart';

import 'fetch_data.dart';

class CloudFirestoreWrite extends StatefulWidget {
  const CloudFirestoreWrite({super.key});

  @override
  State<CloudFirestoreWrite> createState() => _CloudFirestoreWriteState();
}

class _CloudFirestoreWriteState extends State<CloudFirestoreWrite> {
  final titleController= TextEditingController();

 final database= FirebaseFirestore.instance.collection('userdata');

  bool loading=false;
  final _key= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,

        title: Text('Cloud FireStore Write Operation'),
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
                  title: 'Save',
                  onTap: (){
                    if(_key.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });

                      String id= DateTime.now().millisecondsSinceEpoch.toString();
                  database.doc(id).set({
                    'title':titleController.text.toString(),
                    'id':id
                  }).then((value) {
                    setState(() {
                      loading=false;
                    });
                    titleController.clear();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>FetchDatabase()));
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
  @override
  void dispose() {
    titleController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
