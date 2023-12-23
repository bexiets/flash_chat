import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/chat_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future signInwithEmail() async{
    final result = await auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);  
    log('result $result');

    if(!mounted) return;
    await Navigator.push(context, MaterialPageRoute(builder: (context){
      return ChatPage(email: result.user!.email!, userId: result.user!.uid);
    }));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'flash',
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
            )
          ),
          SizedBox(height: 20,),
          Padding(
          padding: const EdgeInsets.fromLTRB(30,0,30,0),
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.account_box_sharp),
              focusedBorder: OutlineInputBorder(
                
                borderSide: BorderSide(
                  color: Colors.black
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                )
              ),
              
              fillColor: Colors.black,
              labelText: 'Enter your username',
              
              labelStyle: TextStyle(
                color: Colors.black,
              )
            ),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(30,0,30,0),
          child: TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.key),
              focusedBorder: OutlineInputBorder(
                
                borderSide: BorderSide(
                  color: Colors.black
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                )
              ),
              
              fillColor: Colors.black,
              labelText: 'Enter your password',
              
              labelStyle: TextStyle(
                color: Colors.black,
              )
            ),
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(350, 50),
          ),
                  onPressed: () async{
                    await signInwithEmail();
                  }, 
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

          
        ],
      ),
    );
  }
}

