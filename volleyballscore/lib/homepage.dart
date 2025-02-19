import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int teamAscore = 0;
  int teamBscore = 0;

  void incrementTeamA() {
    setState(() {
      teamAscore++;
    });
  }

  void incrementTeamB() {
    teamBscore++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Score Board',
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      persistentFooterButtons: [
        Center(child: Text("Developed by XYZ")),
      ],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text("Volleyball Score Board Application",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('A',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                Text('B',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(teamAscore.toString(),
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                Text(teamBscore.toString(),
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      incrementTeamA();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      incrementTeamB();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            IconButton(
                iconSize: 50,
                color: Colors.black,
                onPressed: () {},
                icon: Icon(Icons.restore))
          ],
        ),
      ),
    );
  }
}
