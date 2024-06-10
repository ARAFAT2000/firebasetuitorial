
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthServices{
//cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth= FirebaseAuth.instance;

  Future<String> RegisterUser({
    required String email,
    required String password,
    required String username
  })async{
    String res= 'Successfully create account';
    try{
      if(username.isNotEmpty || password.isNotEmpty || email.isNotEmpty){
        //auth
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password);
        // set data cloud firestore
        await _firestore.collection('arafat').doc(credential.user!.uid).set({
          'name': username,
          'email': email,
          'uid': credential.user!.uid
        });
        res= 'Succes';
      }

    }catch(e){
      print(e.toString());
    }
    return res;
  }
  Future<String>login({
    required String email,
    required String password,
    required String username
})async{
    String res= 'some occured';
    try{
      if(password.isNotEmpty || email.isNotEmpty || username.isNotEmpty){
        await _auth.signInWithEmailAndPassword(
            email: email,
            password: password);
        res= 'Succes';
      }else{
        res= 'please fill up the all field';
      }
    }catch(e){
      print(e.toString());
}
return res;
}
Future<void> logOut()async{
    await _auth.signOut();
}

}
