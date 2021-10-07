import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  late ConfettiController controllerTopCenter;
  @override
  void initState() {
    setState(() {
      initController();
    });
    super.initState();
  }

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          buildConfettiWidget(controllerTopCenter, pi / 1),
          buildConfettiWidget(controllerTopCenter, pi / 4),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  "assets/trophy.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                )
              ],
            ),
          ),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: ElevatedButton(
          child: Text(
            "Congratulations!",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            controllerTopCenter.play();
          },
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 60, // set a lower max blast force.fast slow
        minBlastForce: 8, // set a lower min blast force
        emissionFrequency: 1,
        numberOfParticles: 10, // a lot of particles at once
        gravity: 0, //1 means all fall to ground 0 means remain suspended
      ),
    );
  }
}
