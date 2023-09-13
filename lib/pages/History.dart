import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final user = FirebaseAuth.instance.currentUser!;
final CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");
var userHistory = [];

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    getUserHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 152, 173, 196),
      ),
      body: Container(
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
              return Slidable(
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (userHistory) {
                      deletUserHistory();
                    },
                    backgroundColor: Color.fromARGB(255, 219, 59, 48),
                    foregroundColor: Color.fromARGB(255, 243, 240, 240),
                    icon: Icons.delete,
                    spacing: 3,
                  )
                ]),
                child: ListTile(
                  tileColor: Color.fromARGB(255, 199, 212, 199),
                  title: Text(elements[0]),
                  subtitle: Text(elements[1]),
                  trailing: Text(elements[2]),
                ),
              );
            }),
      ),
    );
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

  deletUserHistory() async {
    await userCollection.doc(user.uid).get().then((value) {
      var data = value.data() as Map<String, dynamic>;
      var historyArr = data['sentimentHistory'] as List;
      setState(() {
        userHistory.remove(value);
      });
    });
  }

  translate(String sen) async {
    String sentemint = sen;
    String arabic = "";
    if (sentemint == 'joy') {
      arabic = 'سعيد';
    }
    if (sentemint == 'fear') {
      arabic = 'خائف';
    }
    if (sentemint == 'surprise') {
      arabic = 'متفاجئ';
    }
    if (sentemint == 'sadness') {
      arabic = 'حزين';
    }
    if (sentemint == 'love') {
      arabic = 'حب';
    }
    if (sentemint == 'sympathy') {
      arabic = 'تعاطف';
    }
    if (sentemint == 'anger') {
      arabic = 'غاضب';
    }
    if (sentemint == 'none') {
      arabic = 'حيادي';
    } else {
      arabic = sentemint;
    }
    return arabic;
  }
}
