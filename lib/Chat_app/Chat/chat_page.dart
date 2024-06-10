import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetuitorial/Chat_app/Chat/display_messege.dart';
import 'package:firebasetuitorial/Chat_app/Services/services.dart';
import 'package:firebasetuitorial/Chat_app/screen/login_screen.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  String username;
   ChatPage({
    super.key,
    required this.username
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messegeController=TextEditingController();
  final FirebaseFirestore firestore= FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final size=  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        actions: [
        IconButton(
         onPressed: (){
           AuthServices().logOut();
           Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
         },
         icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.8,
              child: DisplayMessege(username: widget.username),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messegeController,
                      decoration: InputDecoration(
                          filled: true,
                          enabled: true,
                          hintText: 'messege',
                          contentPadding: EdgeInsets.only(left: 15,top: 8,bottom: 8),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      validator: (value){
                        return null;
                      },
                      onSaved: (value){
                        messegeController.text = value!;
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        if(messegeController.text.isNotEmpty){
                          firestore.collection('Messege').doc().set({
                            'messege' : messegeController.text.toString().trim(),
                            'Time': DateTime.now(),
                            'name': widget.username
                          });
                          messegeController.clear();
                        }
                      },
                      icon: Icon(Icons.send,
                      color: Colors.blue,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
