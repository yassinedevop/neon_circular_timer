import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          backgroundColor: Colors.grey.shade400,
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: NeonCircularTimer(
                width: 200,
                height: 200,
                duration: 10,
                strokeWidth: 10,
                outerStrokeColor: Colors.grey.shade100,
                fillGradient: LinearGradient(colors: [
                  Colors.greenAccent.shade200,
                  Colors.blueAccent.shade400
                ]),
                ringGradient: LinearGradient(colors: [
                  Colors.greenAccent.shade200,
                  Colors.blueAccent.shade400
                ]),
                strokeCap: StrokeCap.round,
                fillColor: Colors.black12,
                ringColor: Colors.blue.shade900),
          ),
        ));
  }
}
