import 'package:flash_chat/login_page.dart';
import 'package:flash_chat/register_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'flash',
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  )
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Flash Chat', textStyle: TextStyle(
                        color: Colors.indigo,
                        fontSize: 40
                      )),
                      
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, createRoute()
                      
                    );
                  },
                  child: Text(
                    'Login'
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50)
                  ),
                  onPressed: () {
                    Navigator.push(context, createRouteRegister());
                  }, 
                  child: Text(
                    'Register'
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRouteRegister() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const RegisterPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
