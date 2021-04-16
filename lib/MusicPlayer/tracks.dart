import 'dart:io';

import 'package:fitness/MusicPlayer/music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Tracks extends StatefulWidget {
  static String id = 'Tracks';
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs = [];
  int currentIndex = 0;
  final GlobalKey<MusicPlayerState> key = GlobalKey<MusicPlayerState>();
  void initState() {
    super.initState();
    getTracks();
  }

  void getTracks() async {
    songs = await audioQuery.getSongs();
    setState(
      () {
        songs = songs;
      },
    );
  }

  void changeTrack(bool isNext) {
    if (isNext) {
      if (currentIndex != songs.length - 1) {
        currentIndex++;
      }
    } else {
      if (currentIndex != 0) {
        currentIndex--;
      }
    }
    key.currentState.setSong(songs[currentIndex]);
  }

  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D343C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D343C),
        elevation: 0,
        title: Text('Music List', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: songs.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: songs[index].albumArtwork == null
                ? AssetImage('ImageAsset/musicplayer.png')
                : FileImage(
                    File(songs[index].albumArtwork),
                  ),
          ),
          title: Text(
            songs[index].title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            songs[index].artist,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () {
            currentIndex = index;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MusicPlayer(
                    changeTrack: changeTrack,
                    songInfo: songs[currentIndex],
                    key: key),
              ),
            );
          },
        ),
      ),
    );
  }
}
