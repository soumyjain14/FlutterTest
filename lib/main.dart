import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

var url = 'https://i.ytimg.com/vi/Pm0Ga7R-vrM/hqdefault.jpg';
plays() async {
  final player = AudioCache();
  await player.play('B.mp3');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Music App'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 400,
                height: 400,
                child: Card(
                  child: Image.asset('images/kabir.jpg'),
                  color: Colors.grey.shade300,
                  elevation: 5,
                ),
              ),
              Container(
                width: 100,
                height: 50,
                child: Card(
                  child: RaisedButton(
                    child: Text('play'),
                    onPressed: plays,
                  ),
                  color: Colors.green,
                  elevation: 5,
                ),
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
