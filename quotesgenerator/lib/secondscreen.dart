import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  String quotes = "";
  String author = "";
  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  Future<void> getQuotes() async {
    final response = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/quotes'),
      headers: {
        'X-Api-Key': 'AEHpJRlACV++8ORVypQUHA==1MTD8dqBCCwMOFjD',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        quotes = data[0]['quote'];
        author = data[0]['author'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Quotes Generator',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(quotes),
              SizedBox(
                height: 20,
              ),
              Text(author),
              SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {
                    getQuotes();
                  },
                  icon: Icon(Icons.restart_alt))
            ],
          ),
        ),
      ),
    );
  }
}
