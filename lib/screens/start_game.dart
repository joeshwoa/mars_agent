import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mars_exploration_game/screens/choose_algo_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../componants/space_box.dart';
import '../functions/copy_list_function.dart';
import '../functions/move_functions.dart';
import '../shared/shared.dart';
import 'package:audioplayers/audioplayers.dart';

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {

  late Timer _timer;
  int i =1;
  int current = 0;
  List<int> xAndy = [7,0];
  bool f=false;
  var c = ScrollController();
  AudioPlayer audioPlaying = AudioPlayer();
  AudioPlayer goldAudioPlaying = AudioPlayer();
  bool mute = false;
  bool first = true;

  @override
  void initState() {
    super.initState();
    audioPlaying.play(AssetSource("desert.mp3"));

    audioPlaying.onPlayerStateChanged.listen((state){
      setState(() {
        state = PlayerState.playing;
      });
    });
    goldAudioPlaying.onPlayerStateChanged.listen((state){
      setState(() {
        state = PlayerState.playing;
      });
    });

    if(!f){
      _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        setState(() {
          if(first)
            {
              c.jumpTo( (c.position.maxScrollExtent) );
              first = false;
            }
          if(i<path.length){
            int next = int.parse(path[i]);
            if (next == current + 1) {
              if(intTable[xAndy[0]][xAndy[1]+1]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveRigth(xAndy[0], xAndy[1]);
              current = next;
              i += 1;
            }
            if (next == current - 1) {
              if(intTable[xAndy[0]][xAndy[1]-1]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveLeft(xAndy[0], xAndy[1]);
              current = next;
              i += 1;
            }
            if (next == current + 8) {
              if(intTable[xAndy[0]-1][xAndy[1]]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveUp(xAndy[0], xAndy[1]);
              current = next;
              c.jumpTo( (c.position.maxScrollExtent*(xAndy[0]))/8 );
              i += 1;
            }
            if (next == current - 8) {
              if(intTable[xAndy[0]+1][xAndy[1]]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveDown(xAndy[0], xAndy[1]);
              current = next;
              c.jumpTo( (c.position.maxScrollExtent*(xAndy[0]+1))/8 );
              i += 1;
            }
            if(current != 63){
              intTable[0][7]=-2;
            }
          }
          else{
            f=true;
            audioPlaying.pause();
          }
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    List<List<Widget>> widgetTable= [
      [
        SpaceBox(0,0),
        SpaceBox(0,1),
        SpaceBox(0,2),
        SpaceBox(0,3),
        SpaceBox(0,4),
        SpaceBox(0,5),
        SpaceBox(0,6),
        SpaceBox(0,7),
      ],
      [
        SpaceBox(1,0),
        SpaceBox(1,1),
        SpaceBox(1,2),
        SpaceBox(1,3),
        SpaceBox(1,4),
        SpaceBox(1,5),
        SpaceBox(1,6),
        SpaceBox(1,7),
      ],
      [
        SpaceBox(2,0),
        SpaceBox(2,1),
        SpaceBox(2,2),
        SpaceBox(2,3),
        SpaceBox(2,4),
        SpaceBox(2,5),
        SpaceBox(2,6),
        SpaceBox(2,7),
      ],
      [
        SpaceBox(3,0),
        SpaceBox(3,1),
        SpaceBox(3,2),
        SpaceBox(3,3),
        SpaceBox(3,4),
        SpaceBox(3,5),
        SpaceBox(3,6),
        SpaceBox(3,7),
      ],
      [
        SpaceBox(4,0),
        SpaceBox(4,1),
        SpaceBox(4,2),
        SpaceBox(4,3),
        SpaceBox(4,4),
        SpaceBox(4,5),
        SpaceBox(4,6),
        SpaceBox(4,7),
      ],
      [
        SpaceBox(5,0),
        SpaceBox(5,1),
        SpaceBox(5,2),
        SpaceBox(5,3),
        SpaceBox(5,4),
        SpaceBox(5,5),
        SpaceBox(5,6),
        SpaceBox(5,7),
      ],
      [
        SpaceBox(6,0),
        SpaceBox(6,1),
        SpaceBox(6,2),
        SpaceBox(6,3),
        SpaceBox(6,4),
        SpaceBox(6,5),
        SpaceBox(6,6),
        SpaceBox(6,7),
      ],
      [
        SpaceBox(7,0),
        SpaceBox(7,1),
        SpaceBox(7,2),
        SpaceBox(7,3),
        SpaceBox(7,4),
        SpaceBox(7,5),
        SpaceBox(7,6),
        SpaceBox(7,7),
      ],
    ];

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: ListView(
          controller: c,
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Image(image: AssetImage("assets/c6ae2f31f1.jpeg.jpg"),fit: BoxFit.fill),
                  width: 100.w,
                  height: 100.w,
                ),
                SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: Table(
                    children: [
                      TableRow(
                          children: widgetTable[0]
                      ),
                      TableRow(
                          children: widgetTable[1]
                      ),
                      TableRow(
                          children: widgetTable[2]
                      ),
                      TableRow(
                          children: widgetTable[3]
                      ),
                      TableRow(
                          children: widgetTable[4]
                      ),
                      TableRow(
                          children: widgetTable[5]
                      ),
                      TableRow(
                          children: widgetTable[6]
                      ),
                      TableRow(
                          children: widgetTable[7]
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.px),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            color: Color(0xff224364).withOpacity(0.3),
                            border: Border.all(color: Color(0xffffffff),width: 2.px)
                        ),
                        child: MaterialButton(
                          child: Icon(Icons.arrow_back,color: Color(0xffffffff)),
                          onPressed: ()
                          {
                            f=true;
                            _timer.cancel();
                            setState(() {
                              path=[];
                              intTable= copy(modifiedTable);
                              audioPlaying.stop();
                              audioPlaying.dispose();
                            });

                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChooseAlgoScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
