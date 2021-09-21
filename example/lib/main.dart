import 'package:flutter/material.dart';

import 'package:neon_circular_timer/neon_circular_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CountDownController controller = new CountDownController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              title: Text('neon circular timer'),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeonCircularTimer(
                      onComplete: () {
                        controller.restart();
                      },
                      width: 200,
                      controller: controller,
                      duration: 20,
                      strokeWidth: 10,
                      isTimerTextShown: true,
                      neumorphicEffect: true,
                      outerStrokeColor: Colors.grey.shade100,
                      innerFillGradient: LinearGradient(colors: [
                        Colors.greenAccent.shade200,
                        Colors.blueAccent.shade400
                      ]),
                      neonGradient: LinearGradient(colors: [
                        Colors.greenAccent.shade200,
                        Colors.blueAccent.shade400
                      ]),
                      strokeCap: StrokeCap.round,
                      innerFillColor: Colors.black12,
                      backgroudColor: Colors.grey.shade100,
                      neonColor: Colors.blue.shade900),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(Icons.play_arrow),
                              onPressed: () {
                                controller.resume();
                              }),
                          IconButton(
                              icon: Icon(Icons.pause),
                              onPressed: () {
                                controller.pause();
                              }),
                          IconButton(
                              icon: Icon(Icons.repeat),
                              onPressed: () {
                                controller.restart();
                              }),
                        ]),
                  )
                ],
              ),
            )));
  }
}
