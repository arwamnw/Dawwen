// ignore_for_file: prefer_const_constructors

//import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/my_textfield.dart';
import '../../components/my_button.dart';

class RegPage extends StatefulWidget {
  final Function()? onTap;
  RegPage({super.key, required this.onTap});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  //txt editing controller
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final conpasswordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();

  final agecontroller = TextEditingController();

  var loading = false;

  //sing in method
  void singupmethod() async {
    //show loading circle
    if (loading) {
      showDialog(
        context: context,
        // useRootNavigator: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    //try sign up
    try {
      loading = true;
      if (passwordcontroller.text == conpasswordcontroller.text) {
        UserCredential authResult = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'username': usernamecontroller.text.trim(),
          'email': emailcontroller.text.trim(),
          'age': int.parse(agecontroller.text.trim()),
          'sentimentHistory': []
        });
      } else {
        //show error passwords don't match
        showerror('كلمة المرور غير متطابقه');
      }

      // adduserdetails(
      //     firstnamecontroller.text.trim(),
      //     lastnamecontroller.text.trim(),
      //     usernamecontroller.text.trim(),
      //     int.parse(agecontroller.text.trim()));

      //pop the circle
      // Navigator.pop(context);
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
        loading = false;
      });
    }
  }

  void adduserdetails(
      String FirstName, String LastName, String Email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': FirstName,
      'email': Email,
      'age': age,
    });
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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              //logo
              //Image.asset(
              //'lib\Images\logo.png',
              //),

              SizedBox(
                height: 30,
              ),
              //welcomback
              Text(
                'حساب جديد',
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
              SizedBox(
                height: 25,
              ),

              //names txtfields
              MyTextField(
                controller: usernamecontroller,
                hinttext: ' اسم المستخدم',
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 15,
              ),
              //age txtfiled

              MyTextField(
                controller: agecontroller,
                hinttext: ' العمر',
                obscureText: false,
              ),
              SizedBox(
                height: 15,
              ),
              //username textfield
              MyTextField(
                controller: emailcontroller,
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

              SizedBox(
                height: 15,
              ),

              MyTextField(
                controller: conpasswordcontroller,
                hinttext: 'تاكيد كلمة المرور',
                obscureText: true,
              ),
              //forgor password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //sing in button
              Mybutton(
                txt: 'حساب جديد',
                onTap: singupmethod,
              ),
              SizedBox(
                height: 50,
              ),
              //or continue with

              //google sing in button

              //not a memeber ? regiester
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' لديك حساب'),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'سجل دخول الان ',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
