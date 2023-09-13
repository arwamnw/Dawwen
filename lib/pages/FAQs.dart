// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 199, 212, 199),
        title: Row(
          children: [
            Text(
              'الاسئلة الشائعة',
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
                  height: 1000,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'هل التطبيق مجاني؟',
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
                          const Text(
                            'نعم، التطبيق مجاني لحاملي اجهزة اندرويد',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'ما هي سياسة الخصوصية في دوّن؟',
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
                          const Text(
                            'امان و سرية المعلومات: نحن نقدر ثقتك لتزويدنا بمعلوماتك الشخصية، ولذلك نحن نسعى جاهدين لحمايتها والحفاظ عليها من سوء الاستخدام والفقد',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'كيف احدد موقعي على الخريطة؟',
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
                          const Text(
                            'ابحث عن مكانك بالخريطة و ثم انقر عليه، بعد ذلك انقر على رمز البث المباشر في اسفل يمين الشاشة ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'كيف استعرض اقرب مراكز الصحة النفسية؟',
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
                          const Text(
                            'ابحث عن فئة "مراكز الصحة النفسية بالقرب مني" ثم انقر على عرض، ستعرض لك مجموعة من المراكز بالقرب منك، ثم اختر مكانا منها',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 82, 82, 82),
                            ),
                            textAlign: TextAlign.center,
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
