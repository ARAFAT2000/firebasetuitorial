// Corrected import
import 'package:firebasetuitorial/Chat_app/widget/round_botton.dart';
import 'package:flutter/material.dart';

import '../../Utils/round_button.dart';
import '../Services/services.dart';
import '../widget/input_textfield.dart';
import '../widget/toast_messege.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool isLoading = false;
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  void signUp() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthServices().RegisterUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      username: usernameController.text.trim(),
    );

    if (res == 'Succes') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      toatmessege(res); // Corrected function call
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                Text('Create Account'),
                SizedBox(
                  height: size.height / 12,
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
                  onfieldSubmitedValue: (value) {},
                  onValidator: (value) {
                    return value.isEmpty ? 'Enter Email' : null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: 'Email',
                  obscureText: false,
                ),
                InputTextField(
                  myController: passwordController,
                  focusNode: passwordFocusNode,
                  onfieldSubmitedValue: (value) {},
                  onValidator: (value) {
                    return value.isEmpty ? 'Enter Password' : null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  hint: 'Password',
                  obscureText: true,
                ),
                  RoundButton(title: 'Register',
                      onpress:(){
                        signUp();
                        
                      } ,
                  ),
                Row(
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text('Log In'),
                    ),
                  ],
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
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
