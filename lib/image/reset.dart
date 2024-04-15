import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _loginState();
}

class _loginState extends State<forgetpassword> {
  final _emailcontroller=TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }
  Future passwordreset() async{
try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailcontroller.text.trim());
  showDialog(context: context, builder: (context){
    return AlertDialog(
        content:Text("password reset link set check your email"),
    );
  });

} on FirebaseAuthException catch(e){
  print(e);
  showDialog(context: context, builder: (context){
    return AlertDialog(
      content:Text(e.message.toString())
    );
  });
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset",style: TextStyle(color:Colors.blue),),),
      body: Center(child: Column(
          children: [

            TextField(
      controller: _emailcontroller,
      decoration: InputDecoration(hintText: 'Enter your Email'),

      ),
            MaterialButton(onPressed: (){
             passwordreset();
            },
            child:Text("Recet password"),
              color:Colors.grey[20],
            )
    ]
    )
    ));

    // TODO: implement build
  }




}