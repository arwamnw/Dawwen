// ignore_for_file: prefer_const_constructors

//import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/my_textfield.dart';
import '../../components/my_button.dart';
import 'forgetpass.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //txt editing controller
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  var loading = false;
  //sing in method
  void singinmethod() async {
    //show loading circle
    if(loading){
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    //try sign in
    try {
      loading = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernamecontroller.text, password: passwordcontroller.text);
      //pop the circle
      // Navigator.pop(context);
      setState(() {
        loading=false;
      });
    } on FirebaseAuthException catch (e) {
      //pop the circle
      // Navigator.pop(context);
      //WRONG EMAIL
      if (e.code == 'user-not-found') {
        //SHOW eroor to the user
        showerror('البريد الالكتروني غير صحيح');
        //WRONG PASSWORD
      } else if (e.code == 'wrong-password') {
        //show error to the user
        showerror('كلمة المرور غير صحيحه');
      }
      setState(() {
        loading=false;
      });
    }
  }

  //show error meassgeg
  void showerror(String m) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(m),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              //logo
              Image.network(
                'https://i.pinimg.com/564x/75/ad/5b/75ad5b1d401735366b17b69cb08e8b82.jpg',
                height: 270,
                width: 270,
              ),

              // Icon(
              // Icons.lock,
              //size: 100,
              //),

              //welcomback
              // Text(
              //   'اهلا بعودتك!',
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 30,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              //username textfield
              MyTextField(
                controller: usernamecontroller,
                hinttext: 'البريد الالكتروني',
                obscureText: false,
              ),

              SizedBox(
                height: 15,
              ),
              //password textfield
              MyTextField(
                controller: passwordcontroller,
                hinttext: 'كلمةالمرور',
                obscureText: true,
              ),
              //forgor password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ForgetPass();
                          }),
                        );
                      },
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //sing in button
              Mybutton(
                txt: 'تسجيل دخول ',
                onTap: singinmethod,
              ),
              SizedBox(
                height: 30,
              ),
              //or continue with

              //google sing in button

              //not a memeber ? regiester
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ليس لديك حساب'),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'سجل الان',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
