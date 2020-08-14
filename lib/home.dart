import 'package:audioplayers/audio_cache.dart';
import 'package:chewie/chewie.dart';
import "package:flutter/material.dart";
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

myapp() {
  var video_player = VideoPlayerController.network(
      "https://flutter-video.s3.us-east-2.amazonaws.com/faded.mp4");

  var chewieController = ChewieController(
    videoPlayerController: video_player,
    aspectRatio: 1.5,
    autoPlay: true,
    looping: true,
  );
  var audioplay = AudioPlayer();
  var song = AudioCache(fixedPlayer: audioplay);
  play_song() {
    song.play("sou.mp3");
  }

  ;
  pause_song() {
    audioplay.pause();
  }

  ;
  stop_music() {
    audioplay.stop();
  }

  ;
  var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Mixed Player",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 10.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.add_comment,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("images/rango.jpg"),
              ),
              elevation: 10.0,
              color: Color.fromARGB(20, 126, 126, 128),
              shadowColor: Color.fromRGBO(185, 120, 150, 10),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.play_circle_filled),
                  onPressed: play_song,
                  color: Colors.white,
                  iconSize: 55.0,
                  autofocus: true,
                  tooltip: "Play Song",
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(Icons.pause_circle_filled),
                  onPressed: pause_song,
                  color: Colors.white,
                  iconSize: 55.0,
                  autofocus: true,
                  tooltip: "Pause-song",
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: stop_music,
                  color: Colors.white,
                  highlightColor: Colors.green.shade800,
                  splashColor: Color.fromARGB(152, 120, 120, 120),
                  iconSize: 55.0,
                  tooltip: "Stop-Music",
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  child: Chewie(
                    controller: chewieController,
                  ),
                ),
              ),
              elevation: 5.0,
            ),
          ),
        ],
      ));
  var material_design = MaterialApp(
    home: myhome,
    debugShowCheckedModeBanner: false,
  );
  return material_design;
}
