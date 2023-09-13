// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void singoutuser() {
  FirebaseAuth.instance.signOut();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 152, 173, 196),
        actions: [IconButton(onPressed: singoutuser, icon: Icon(Icons.logout))],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildtop(),
          SizedBox(
            height: 68,
          ),
          Buildcontent()
        ],
      ),
    );
  }

  Widget Buildcontent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            user.email.toString().trim(),
            style: TextStyle(fontSize: 20),
          ),
          Text(''),
          Text('Age : 23')
        ],
      ),
    );
  }

  Widget buildtop() {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildcoverImg(),
          Positioned(top: 100, child: buildProficPic())
        ]);
  }

  Widget buildProficPic() {
    return CircleAvatar(
      radius: 140 / 2,
      backgroundColor: Colors.grey.shade300,
      backgroundImage: NetworkImage(
          'https://i.pinimg.com/564x/12/3b/df/123bdf84e258f03311571b8f3cf7eb6a.jpg'),
    );
  }

  Widget buildcoverImg() {
    return Container(
      color: Colors.grey,
      child: Image.network(
        'https://i.pinimg.com/564x/a3/84/34/a38434a098644ee508879e51da513082.jpg',
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }

  getUserHistory() async {
    await userCollection.doc(user.uid).get().then((value) {
      var data = value.data() as Map<String, dynamic>;
      var historyArr = data['sentimentHistory'] as List;
      setState(() {});
    });
  }
}
