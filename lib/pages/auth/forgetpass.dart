import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/my_button.dart';
import '../../components/my_textfield.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final emailcontroller = TextEditingController();

  void forgot() async {
    try {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('تم ارسال رابط تجديد كلمة المرور '),
            );
          });
    } on FirebaseAuthException catch (e) {
      // TODO

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 196, 174),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'ادخل بريدك الالكتروني لتجديد كلمة المرور',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: emailcontroller,
              hinttext: 'البريد الالكتروني',
              obscureText: false),
          SizedBox(
            height: 25,
          ),
          Mybutton(onTap: forgot, txt: "ارسل"),
        ],
      ),
    );
  }
}
