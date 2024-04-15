import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/image/reset.dart';

import '../main.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email='' ,password='';
  FirebaseAuth instance=FirebaseAuth.instance;
  var loginkey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:loginkey,
        appBar: AppBar(title: Text("Login",style: TextStyle(color:Colors.blue),),),
        body: Center(child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter your Email'),
              onChanged: (value){
                setState(() {
                  this.email=value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter your password'),
              onChanged: (value){
                setState(() {
                  this.password=value;
                });
              },
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return forgetpassword();
                }));
              },
            ),
            MaterialButton(
                child: Text("login"),
                onPressed: ()async{
          try{
           UserCredential credential=await instance.signInWithEmailAndPassword(email:this.email,password:this.password);
           Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MyHomePage(title: 'hgfhg',)));

          } on FirebaseAuthException catch(e){
            if (e.code == 'not found') {
            /*  if (loginkey.currentState != null) {
                loginkey.currentState!.showSnackBar(
                  SnackBar(
                    content: Text("invalid email"),
                  ),
                );
              }*/
              print("not found");
            }

   else if(e.code=='wrong password'){
     print("wrong password");
   }
          }
                }),
            MaterialButton(
                child: Text("register")
                ,onPressed: (){

            })

          ],
        ),)
    );
  }
}