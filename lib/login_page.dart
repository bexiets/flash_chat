import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  onPressed: () {}, 
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