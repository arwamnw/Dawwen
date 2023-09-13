import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawwen02/pages/dayspages/badDay.dart';
import 'package:dawwen02/pages/dayspages/badDay2.dart';
import 'package:dawwen02/pages/dayspages/badDay3.dart';
import 'package:dawwen02/pages/dayspages/goodDay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class ClassifyPage extends StatefulWidget {
  ClassifyPage({super.key});

  @override
  State<ClassifyPage> createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String errMsg = "";

  var TOKEN = "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";
  var API_URL =
      "https://api-inference.huggingface.co/models/hatemnoaman/bert-base-arabic-finetuned-emotion";

  var LABEL_TO_TEXT = {
    'LABEL_0': "none",
    'LABEL_1': "anger",
    'LABEL_2': "joy",
    'LABEL_3': "sadness",
    'LABEL_4': "love",
    'LABEL_5': "sympathy",
    'LABEL_6': "surprise",
    'LABEL_7': "fear",
  };

  var userInput = TextEditingController();
  var prediction = "";
  var userHistory = [];

  @override
  void initState() {
    getUserHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 152, 173, 196),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: userInput,
                maxLines: 25,
                decoration: InputDecoration(
                    hintText: 'أكتب هنا',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Color.fromRGBO(152, 173, 196, 0.4),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            //Text("Model Output: $prediction"),
            TextButton(
              onPressed: predict,
              child: Text(
                "ارسل",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 50, 51, 50)),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 199, 212, 199)),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              height: 600,
              child: ListView.builder(
                  itemCount: userHistory.length,
                  // reverse: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    String item = userHistory[index] as String;
                    var elements = item.split(";");
                    return ListTile(
                      title: Text(elements[0]),
                      subtitle: Text(elements[1]),
                      trailing: Text(elements[2]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void predict() async {
    try {
      var result = await detectSentiment(userInput.text);
      addToDatabase(result).then((res) {
        setState(() {
          prediction = result.toString();
          errMsg = "";
        });

        //getUserHistory();
        navigateP(result);
      });
    } on Exception catch (e) {
      errMsg = e.toString();
      print("errmsg = " + errMsg);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errMsg)));
    }
  }

  detectSentiment(String text) async {
    final response = await http.post(Uri.parse(API_URL),
        headers: <String, String>{
          'Authorization': 'Bearer $TOKEN',
          'Content-Type': 'application/json',
        },
        body: json.encode(<String, List<dynamic>>{
          "text": [text]
        }));
    print("response=" + response.statusCode.toString());
    print("response=" + json.decode(response.body).toString());
    if (response.statusCode < 200 || response.statusCode >= 300) {
      var res = json.decode(response.body);

      throw Exception(res['error']);
    }
    var predicted_label = jsonDecode(response.body)[0]['label'].toString();
    print(LABEL_TO_TEXT[predicted_label]);
    return LABEL_TO_TEXT[predicted_label];
  }

  Future addToDatabase(result) async {
    DateTime now = DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);

    await userCollection.doc(user.uid).update({
      "sentimentHistory":
          FieldValue.arrayUnion(["${userInput.text.trim()};$result;$date"])
    });
  }

  getUserHistory() async {
    await userCollection.doc(user.uid).get().then((value) {
      var data = value.data() as Map<String, dynamic>;
      var historyArr = data['sentimentHistory'] as List;
      setState(() {
        userHistory = historyArr;
      });
    });
  }

  navigateP(String result) async {
    if (result == 'joy') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GoodDay()));
    }
    if (result == 'fear') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BadDaypage()));
    }
    if (result == 'surprise') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BadDaypage()));
    }
    if (result == 'sadness') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BadDay2()));
    }
    if (result == 'none') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BadDaypage()));
    }
    if (result == 'love') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GoodDay()));
    }
    if (result == 'sympathy') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GoodDay()));
    }
    if (result == 'anger') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BadDay3()));
    }
  }
}
