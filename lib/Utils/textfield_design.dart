

import 'package:flutter/material.dart';

InputDecoration ModifyTextField(String email ,Widget prefixicon){
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
     hintText: email,
    hoverColor: Colors.red,
    prefixIcon: prefixicon,
  );
}