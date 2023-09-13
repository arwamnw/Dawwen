// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, sort_child_properties_last
import 'AboutUs.dart';
import 'ContactUsPage.dart';
import 'FAQs.dart';
import 'settingTile.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 199, 212, 199),
        title: Row(
          children: [
            Text(
              'الاعدادات',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 40),
              SettingsTile(
                color: const Color.fromARGB(255, 98, 133, 100),
                icon: Icons.people_outline,
                title: "من نحن",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsPage()),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SettingsTile(
                color: Color.fromARGB(255, 128, 160, 120),
                icon: Icons.chat_bubble,
                title: "الاسئلة الشائعة",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FAQPage()),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SettingsTile(
                color: Color.fromARGB(255, 141, 170, 150),
                icon: Icons.call,
                title: "اتصل بنا",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsPage()),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
