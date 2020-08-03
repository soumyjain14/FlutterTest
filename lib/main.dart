import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:swipedetector/swipedetector.dart';

void main() {
  runApp(MyApp());
}

var url = 'https://i.ytimg.com/vi/Pm0Ga7R-vrM/hqdefault.jpg';
plays() async {
  final player = AudioCache();
  await player.play('Tujhe.mp3');
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
          title: Text('My Music App'),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
                title: Text(
                  'This is just a basic App which plays 2 songs for you, the App comes with play/pause feature and has the swipe facility to shift between the two songs',
                  style: TextStyle(fontSize: 20),
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
                        '${_swipeDirection == '' ? 'images/kabir.jpg' : 'images/pika.jpg'}'),
                    color: Colors.grey.shade300,
                    elevation: 5,
                  ),
                ),
                onSwipeLeft: () {
                  assetsAudioPlayer.pause();
                  assetsAudioPlayer.open(
                        Audio('assets/B.mp3'));

                  setState(() {
                    _swipeDirection = "Swipe Left";
                  });
                },
                onSwipeRight: () {
                  assetsAudioPlayer.pause();
                  assetsAudioPlayer.open(
                        Audio('audio/Tujhe.mp3'));
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
                    child: Text('Play the song'),
                    onPressed: () {
                      assetsAudioPlayer.open(
                        Audio('${_swipeDirection == '' ? 'audio/Tujhe.mp3' : 'assets/B.mp3'}'),
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
