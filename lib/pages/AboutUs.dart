// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 199, 212, 199),
        title: Row(
          children: [
            Text(
              'من نحن',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
          child: Center(
            child: Column(children: [
              Card(
                elevation: 1,
                shadowColor: Colors.black,
                color: Color.fromARGB(255, 230, 245, 230),
                child: SizedBox(
                  width: 300,
                  height: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'دوّن هو تطبيق للهاتف المحمول يستهدف المستخدمين العرب من جميع الأعمار الذين يعانون من مشاكل الصحة العقلية ويساعدهم في التغلب على الصعوبات والصعوبات اليومية من خلال التأمل والدروس. يتيح التطبيق للمستخدمين كتابة المجلات على أساس يومي والحصول على حالتهم بناءً على نتيجة تصنيف المجلة ، ويمكنهم أيضًا عرض أقرب مراكز العلاج واستخراج تقرير دوري بشأن حالتهم',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.green[900],
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
