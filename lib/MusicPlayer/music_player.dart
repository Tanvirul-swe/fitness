import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayer extends StatefulWidget {
  SongInfo songInfo;
  Function changeTrack;
  final GlobalKey<MusicPlayerState> key;
  MusicPlayer({this.songInfo, this.changeTrack, this.key}) : super(key: key);
  MusicPlayerState createState() => MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer> {
  double minimumValue = 0.0, maximumValue = 0.0, currentValue = 0.0;
  String currentTime = '', endTime = '';
  bool isPlaying = false;
  final AudioPlayer player = AudioPlayer();

  void initState() {
    super.initState();
    setSong(widget.songInfo);
  }

  void dispose() {
    super.dispose();
    player?.dispose();
  }

  void setSong(SongInfo songInfo) async {
    widget.songInfo = songInfo;
    await player.setUrl(widget.songInfo.uri);
    currentValue = minimumValue;
    maximumValue = player.duration.inMilliseconds.toDouble();
    setState(() {
      currentTime = getDuration(currentValue);
      endTime = getDuration(maximumValue);
    });
    isPlaying = false;
    changeStatus();
    player.positionStream.listen((duration) {
      currentValue = duration.inMilliseconds.toDouble();
      setState(() {
        currentTime = getDuration(currentValue);
      });
    });
  }

  void changeStatus() {
    setState(() {
      isPlaying = !isPlaying;
    });
    if (isPlaying) {
      player.play();
    } else {
      player.pause();
    }
  }

  String getDuration(double value) {
    Duration duration = Duration(milliseconds: value.round());

    return [duration.inMinutes, duration.inSeconds]
        .map(
          (element) => element.remainder(60).toString().padLeft(2, '0'),
        )
        .join(':');
  }

  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A4852),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2A4852),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white)),
        title: Text('Now Playing', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 100, 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              CircleAvatar(
                backgroundImage: widget.songInfo.albumArtwork == null
                    ? AssetImage('ImageAsset/musicplayer.png')
                    : FileImage(File(widget.songInfo.albumArtwork)),
                radius: 80,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  widget.songInfo.title,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 33),
                child: Text(
                  widget.songInfo.artist,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
              Slider(
                inactiveColor: Colors.black12,
                activeColor: Color(0xFF8B63E6),
                min: minimumValue,
                max: maximumValue,
                value: currentValue,
                onChanged: (value) {
                  currentValue = value;
                  player.seek(
                    Duration(
                      milliseconds: currentValue.round(),
                    ),
                  );
                },
              ),
              Container(
                transform: Matrix4.translationValues(0, -15, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentTime,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      endTime,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
                  Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.skip_previous,
                            color: Colors.white, size: 55),
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          widget.changeTrack(false);
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                            isPlaying
                                ? Icons.pause_circle_filled_rounded
                                : Icons.play_circle_fill_rounded,
                            color: Color(0xFF8B63E6),
                            size: 85),
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          changeStatus();
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.skip_next, color: Colors.white, size: 55),
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          widget.changeTrack(true);
                        },
                      ),
                    ],
                  ),
                ),
            ]),
          ),
      ),
    );
  }
}
