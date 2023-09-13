import 'package:dawwen02/pages/FavPage.dart';
import 'package:dawwen02/pages/History.dart';
import 'package:dawwen02/pages/Map.dart';
import 'package:flutter/material.dart';
import 'Calendar.dart';
import 'ClassifyPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: null,
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 45 / 100,
              color: Color.fromARGB(255, 199, 212, 199),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "! اهلا بك",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                      textDirection: TextDirection.ltr,
                    ),
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        childAspectRatio: .65,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ClassifyPage();
                                }),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Image.network(
                                    'https://i.pinimg.com/564x/df/c7/d9/dfc7d9b1e66af95b88761717d1c2a747.jpg',
                                    height: 200,
                                    width: 200,
                                  ),
                                  Text(
                                    'دَوِّن',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[800],
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return History();
                                }),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    'https://i.pinimg.com/564x/fe/0a/89/fe0a89d47ec607091fa65341c9d4e097.jpg',
                                    height: 222,
                                    width: 200,
                                  ),
                                  Text(
                                    'السجل',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[800],
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return MapSample();
                                }),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    'https://i.pinimg.com/564x/8a/e6/0a/8ae60af6344d681c0059ea9567f5a930.jpg',
                                    height: 140,
                                    width: 140,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'مراكز بالقرب منك',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[800],
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return FavPage();
                                }),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    'https://i.pinimg.com/564x/67/97/ef/6797efe42126b11479e9782fe0540512.jpg',
                                    height: 140,
                                    width: 140,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'المفضلة',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[800],
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
