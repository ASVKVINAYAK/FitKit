import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcersiseScreen extends StatefulWidget {
  @override
  _ExcersiseScreen createState() => _ExcersiseScreen();
}

class _ExcersiseScreen extends State<ExcersiseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Be Fit at Home by doing exercises"),
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
                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/2MoGxae-zyo"),
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
                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/ml6cT4AZdqI"),
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
                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/gC_L9qAHVJ8"),
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
                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/_W9B2ffnO5c"),
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
                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/5Om6M8elJtg"),
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
    initialVideoId:YoutubePlayer.convertUrlToId(" https://youtu.be/lvlEj3VyqAg"),
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