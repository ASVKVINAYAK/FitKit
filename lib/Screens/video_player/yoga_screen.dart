import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YogaScreen extends StatefulWidget {
  @override
  _YogaScreen createState() => _YogaScreen();
}

class _YogaScreen extends State<YogaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Do Yoga at home "),
      ),
      body: Container(
        color: Colors.teal,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(16),
          children: [
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/9kOCY0KNByw"),
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/VaoV1PrYft4"),
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/m2ya7BOVK60"),
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/yKItGCpL73M"),
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/149Iac5fmoE"),
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}