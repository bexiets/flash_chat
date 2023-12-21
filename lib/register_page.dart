import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future registerUser() async{
    final result = await auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    log('result $result');
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
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.key),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
                
              ),
              
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
                    await registerUser();
                  }, 
                  child: Text(
                    'Register',
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