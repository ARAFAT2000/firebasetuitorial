import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetuitorial/Utils/round_button.dart';
import 'package:firebasetuitorial/Utils/tost_message.dart';
import 'package:flutter/material.dart';

import '../Page/home_page.dart';
import '../Utils/textfield_design.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final email= TextEditingController();
  final password= TextEditingController();
  final _key= GlobalKey<FormState>();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 10),
        child: Form(
          key: _key,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                decoration: ModifyTextField(
                    'Email',
                    Icon(Icons.email)),
                validator: (value){
                  if(value==null && value!.isEmpty){
                    return 'Enter email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height/25,
              ),
              TextFormField(
                controller: password,
                decoration: ModifyTextField(
                    'PassWord',
                    Icon(Icons.password)),
                validator: (value){
                  if(value==null && value!.isEmpty){
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height/25,
              ),
              RoundButton(
                loading: loading,
                  title: 'Sign In',
                  onTap: (){
                    if(_key.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      _auth.signInWithEmailAndPassword(
                          email: email.text.toString(),
                          password: password.text.toString())
                          .then((value) {
                            setState(() {
                              loading=false;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      })
                          .onError((error, stackTrace) {
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
