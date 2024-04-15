import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();
  final _namecontroller=TextEditingController();

  String email='' ,password='',name='';
  FirebaseAuth instance=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create accounte",style:TextStyle(color:Colors.blue),),),
        body: Center(

          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(hintText: 'Enter your Email'),
                  onChanged: (value){
                    setState(() {
                      this.email=value;
                    });
                  },
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: _passwordcontroller,

                  decoration: InputDecoration(hintText: 'Enter your password'),
                  onChanged: (value){
                    setState(() {
                      this.password=value;
                    });
                  },
                ),
                SizedBox(height: 10,),

                TextField(
                  controller: _namecontroller,

                  decoration: InputDecoration(hintText: 'Enter your name'),
                  onChanged: (value){
                    setState(() {
                      this.name=value;
                    });
                  },
                ),
                SizedBox(height: 10,),

                MaterialButton(
                    child: Text("register"),
                    onPressed: ()async{
                    try{


                      UserCredential credential=await instance.createUserWithEmailAndPassword(email:this. email, password: this. password);
                      await credential.user!.updateDisplayName(name);

                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MyHomePage(title: 'hgfhg',)));

                    }on FirebaseAuthException catch(e){
                      if(e.code=='weak-password'){
                        print("weak password");
                        }
                      else if(e.code=='email-already-in-use'){
                        print("email -already-exist");
    }

                      }
                    }
                    ),


              ],
            ),),)
    );
  }
}