import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:radio/audio_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Player',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Player Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String url =
      'https://codingwithjoe.com/wp-content/uploads/2018/03/applause.mp3';
  AudioPlayer audioPlayer = new AudioPlayer();
  AudioProvider audioProvider = new AudioProvider(url);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: play,
              child: new Text('Click me to Play'),
            )
          ],
        ),
      ),
    );
  }

  play() async {
    String localUrl = await audioProvider.load();
    audioPlayer.play(localUrl, isLocal: true);

  }
}