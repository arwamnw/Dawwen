// ignore_for_file: prefer_const_constructors

import 'package:dawwen02/pages/home.dart';
import 'package:flutter/material.dart';

class GoodDay extends StatefulWidget {
  const GoodDay({super.key});

  @override
  State<GoodDay> createState() => _GoodDayState();
}

class _GoodDayState extends State<GoodDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /** Card Widget **/
        child: Card(
          elevation: 1,
          shadowColor: Colors.black,
          color: Color.fromARGB(255, 222, 254, 239),
          child: SizedBox(
            width: 300,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '!يبدو ان يومك كان جيدًا',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green[900],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: const Text(
                      '(: نتمنى لك ايامًا جميلة مليئة بالراحة و السعادة',
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 82, 82, 82),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 152, 196, 174))),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [Icon(Icons.touch_app), Text('عودة')],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
