import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

var url = 'https://i.ytimg.com/vi/Pm0Ga7R-vrM/hqdefault.jpg';
plays() async {
  final player = AudioCache();
  await player.play('Tujhe.mp3');
}

void onPressPhone() {
  Fluttertoast.showToast(
      msg: "8837546607",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

void onPressEmail() {
  Fluttertoast.showToast(
      msg: "soumyjain14@gmail.com",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  String _swipeDirection = "";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soumy\'s Music App'),
          backgroundColor: Colors.orange.shade700,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.phone), onPressed: onPressPhone),
            IconButton(icon: Icon(Icons.email), onPressed: onPressEmail),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.red,
                    Colors.orange,
                  ]),
                ),
                child: Center(
                  child: Text(
                    'Soumy\'s Music App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  '---This is just a basic App which plays 2 songs for you ',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  '---The App comes with play/pause feature',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(
                  '---Left swipe facility to shift between the two songs',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SwipeDetector(
                child: Container(
                  width: 400,
                  height: 400,
                  child: Card(
                    child: Image.asset(
                        '${_swipeDirection == '' ? 'images/kabir.jpg' : 'images/Bh.jpg'}'),
                    color: Colors.grey.shade300,
                    elevation: 5,
                  ),
                ),
                onSwipeLeft: () {
                  assetsAudioPlayer.pause();
                  assetsAudioPlayer.open(Audio('assets/D.mp3'));

                  setState(() {
                    _swipeDirection = "Swipe Left";
                  });
                },
                onSwipeRight: () {
                  assetsAudioPlayer.pause();
                  assetsAudioPlayer.open(Audio('audio/Tujhe.mp3'));
                  setState(() {
                    _swipeDirection = "";
                  });
                },
              ),
              Container(
                width: 200,
                height: 50,
                child: Card(
                  child: RaisedButton(
                    color: Colors.orange.shade500,
                    child: Text('Play the song'),
                    onPressed: () {
                      assetsAudioPlayer.open(
                        Audio(
                            '${_swipeDirection == '' ? 'audio/Tujhe.mp3' : 'assets/B.mp3'}'),
                      );
                    },
                  ),
                  color: Colors.green,
                  elevation: 5,
                ),
              ),
              Container(
                width: 200,
                height: 50,
                child: Card(
                  child: RaisedButton(
                    color: Colors.orange.shade500,
                    child: Text('Pause/Resume the song'),
                    onPressed: () {
                      if (isPlaying) {
                        assetsAudioPlayer.playOrPause();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        assetsAudioPlayer.pause();
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                  ),
                  color: Colors.green,
                  elevation: 5,
                ),
              ),
              Container(
                width: 200,
                height: 50,
                child: Card(
                  child: RaisedButton(
                    color: Colors.orange.shade500,
                    child: Text('Stop the song'),
                    onPressed: () {
                      _audioPlayer.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    },
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
