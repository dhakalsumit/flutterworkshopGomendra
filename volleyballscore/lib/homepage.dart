import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController updatedteamAname = new TextEditingController();
  final TextEditingController updatedteamBname = new TextEditingController();
  int teamAscore = 0;
  int teamBscore = 0;
  String teamNameA = 'A';
  String teamNameB = 'B';

  void incrementTeamA() {
    setState(() {
      teamAscore++;
    });
  }

  void incrementTeamB() {
    setState(() {
      teamBscore++;
    });
  }

  void updateteamNameA() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Change Team Name'),
            content: TextField(
              controller: updatedteamAname,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      teamNameA = updatedteamAname.text;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')),
            ],
          );
        });
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
                TextButton(
                    onPressed: () {
                      updateteamNameA();
                    },
                    child: Text(teamNameA,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
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
