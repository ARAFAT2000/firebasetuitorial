import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetuitorial/Utils/round_button.dart';
import 'package:firebasetuitorial/Utils/textfield_design.dart';
import 'package:firebasetuitorial/Utils/tost_message.dart';
import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final email= TextEditingController();
  final password= TextEditingController();
  bool loading=false;

  final _key= GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Center(
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

                RoundButtonF(
                  loading: loading,
                  title: 'Sign Up',
                  onTap: (){
                    if(_key.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      _auth.createUserWithEmailAndPassword(
                          email:email.text.toString(),
                          password: password.text.toString()).then((value) {
                        setState(() {
                          loading=false;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      }).
                      onError((error, stackTrace) {
                        Utils().toastmassege(error.toString());
                        setState(() {
                          loading=false;
                        });
                      });
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {

    email.dispose();
    password.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
