import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = "";
  String image = "";

  Future<void> getData() async {
   final response = await http.get(Uri.parse("https://api.github.com/users/sudipadk10")); 

    if (response.statusCode == 200) {
      
      final data = json.decode(response.body);
      setState(() {
        name = data['name'];
        image = data['avatar_url'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MERO TUTOR PVT. LTD.",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("../images/meroimage.jpg"),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "ID CARD",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("../images/sudip.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "SUDIP ADHIKARI",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Designation:  Cybersecurity Expert",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Batch: 2077",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Contact No : 9812345678",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Colors.blue,
        child: Center(
            child: Text(
          "www.merotutor.com",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
