import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Audio Playback with assets_audio_player')),
        body: Center(child: AudioPlayButton()),
      ),
    );
  }
}

class AudioPlayButton extends StatefulWidget {

  @override
  AudioPlayButtonState createState() => AudioPlayButtonState();
}

class AudioPlayButtonState extends State<AudioPlayButton> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(int num) {
    assetsAudioPlayer.open(
      Audio("assets/note$num.wav"),
    );
  }
  Expanded buildKey(int num, Color color) {
    return Expanded(
      child: Container(
        decoration:BoxDecoration(color:color),
        width: double.infinity,
        child: TextButton(
            onPressed: () => _playAudio(num), child:
            const Text('')
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildKey(1, Colors.red),
        buildKey(2, Colors.orange),
        buildKey(3, Colors.yellow),
        buildKey(4, Colors.green),
        buildKey(5, Colors.blue),
        buildKey(6, Colors.indigo),
        buildKey(7, Colors.purple),

      ],
    );
  }
}
