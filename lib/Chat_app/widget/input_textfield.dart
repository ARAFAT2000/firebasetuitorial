
import 'package:flutter/material.dart';


class InputTextField extends StatelessWidget {
  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onfieldSubmitedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyboardType;
  final String hint;
  final bool obscureText;
  final bool enable,autoFocus;

  const InputTextField({
    super.key,
    required this.myController,
    required this.focusNode,
    required this.onfieldSubmitedValue,
    required this.onValidator,
    required this.keyboardType,
    required this.hint,
    required this.obscureText,
    this.enable =true,
    this.autoFocus = false,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onFieldSubmitted: onfieldSubmitedValue,
        validator: onValidator,
        decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          contentPadding:const EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 0,
              color: Colors.green),
          border:const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color:Colors.deepPurple),
          ),
          focusedBorder:const  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.amberAccent),
          ),
          errorBorder:const  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}