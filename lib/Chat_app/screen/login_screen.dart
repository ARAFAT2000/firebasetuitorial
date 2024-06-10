import 'package:firebasetuitorial/Chat_app/Chat/chat_page.dart';
import 'package:firebasetuitorial/Chat_app/screen/register_screen.dart';
import 'package:firebasetuitorial/Chat_app/widget/input_textfield.dart';
import 'package:firebasetuitorial/Chat_app/widget/round_botton.dart';
import 'package:flutter/material.dart';

import '../Services/services.dart';
import '../widget/toast_messege.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final usernameController = TextEditingController();
  final emailFocusNode= FocusNode();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode= FocusNode();
  bool isLoading= false;
  void signIn()async{
    setState(() {
      isLoading=true;
    });
    String res= await AuthServices().login(
      username: usernameController.text.toString(),
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
        );
    if(res == 'Succes'){
      setState(() {
        isLoading=false;
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>
              ChatPage(
              username: usernameController.text
              )));
    }else{
      setState(() {
        isLoading = false;
      });
      toatmessege(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: ClipOval(
                        child: Image.asset('assets/images/chat.png',
                            height: 150,
                            fit: BoxFit.fill),
                      ),
                    ),

                    SizedBox(
                      height:size.height/12 ,
                    ),
                    InputTextField(
                      myController: usernameController,
                      focusNode: usernameFocusNode,
                      onfieldSubmitedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? 'Enter Name' : null;
                      },
                      keyboardType: TextInputType.name,
                      hint: 'Name',
                      obscureText: false,
                    ),
                    InputTextField(
                        myController: emailController,
                        focusNode: emailFocusNode,
                        onfieldSubmitedValue: (value){

                        },
                        onValidator:  (value){
                          return value.isEmpty ? 'Enter Email': null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Email',
                        obscureText: false
                    ),
                    InputTextField(
                        myController: passwordController,
                        focusNode: passwordFocusNode,
                        onfieldSubmitedValue: (value){

                        },
                        onValidator:  (value){
                          return value.isEmpty ? 'Enter Password': null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Password',
                        obscureText: false
                    ),

                    RoundButton(title: 'Log In ',
                        onpress: (){
                          signIn();

                        }
                    ),
                    Row(
                      children: [
                        Text('Dont have an account '),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                        }, child: Text('Register')),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
    );
  }
}
