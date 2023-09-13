// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 199, 212, 199),
          title: Row(
            children: [
              Center(
                child: Text(
                  'اتصل بنا',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'تواصل معنا من خلال الآتي',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(
                    'جامعة الملك عبدالعزيز',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                  ),
                  subtitle: Text(
                    'جدة، المملكة العربية السعودية',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    '+966 56 277 6893',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(
                    'Dawwen@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                  ],
                ),
              ],
            )));
  }
}
