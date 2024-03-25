import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int randomNumber1 = Random().nextInt(10);
  int randomNumber2 = Random().nextInt(10);
  int rightGuess = Random().nextInt(2);
  Color containerColor1 = const Color.fromARGB(255, 255, 194, 120);
  Color containerColor2 = const Color.fromARGB(255, 255, 194, 120);

  @override
  void initState() {
    super.initState();
    reGenerateRandomNumbers();
  }

  void reGenerateRandomNumbers() {
    setState(() {
      randomNumber1 = Random().nextInt(10);
      randomNumber2 = Random().nextInt(10);
      rightGuess = Random().nextInt(2);
    });
    if (randomNumber1 == randomNumber2) reGenerateRandomNumbers();
  }

  void resetContainerColors() {
    setState(() {
      containerColor1 = const Color.fromARGB(255, 255, 194, 120);
      containerColor2 = const Color.fromARGB(255, 255, 194, 120);
    });
  }

  void actionAfterChoice(int choice) {
    if (rightGuess == choice) {
      setState(() {
        containerColor1 = choice == 0 ? Colors.green : containerColor1;
        containerColor2 = choice == 1 ? Colors.green : containerColor2;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Congratulations!',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'You guessed the right number!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green[700],
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetContainerColors();
                },
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        containerColor1 = choice == 0 ? Colors.red : containerColor1;
        containerColor2 = choice == 1 ? Colors.red : containerColor2;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Oops!',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'You guessed the wrong number!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red[300],
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetContainerColors();
                },
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
    reGenerateRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x000f0f0f),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Guess The Number',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0x000f0f0f),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => actionAfterChoice(0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5 -
                    AppBar().preferredSize.height,
                width: MediaQuery.of(context).size.width,
                color: containerColor1,
                alignment: Alignment.center,
                child: Text(
                  '$randomNumber1',
                  style: const TextStyle(
                      fontSize: 45.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 4.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            GestureDetector(
              onTap: () => actionAfterChoice(1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5 -
                    AppBar().preferredSize.height,
                width: MediaQuery.of(context).size.width,
                color: containerColor2,
                alignment: Alignment.center,
                child: Text(
                  '$randomNumber2',
                  style: const TextStyle(
                      fontSize: 45.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
