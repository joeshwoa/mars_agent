import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mars_exploration_game/functions/copy_list_function.dart';
import 'package:mars_exploration_game/functions/move_functions.dart';
import 'package:mars_exploration_game/phone_view/componants/phone_space_box.dart';
import 'package:mars_exploration_game/phone_view/screens/phone_choose_algo_screen.dart';
import 'package:mars_exploration_game/shared/shared.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:audioplayers/audioplayers.dart';

class PhoneStartGame extends StatefulWidget {
  const PhoneStartGame({Key? key}) : super(key: key);

  @override
  State<PhoneStartGame> createState() => _PhoneStartGameState();
}

class _PhoneStartGameState extends State<PhoneStartGame> {

  late Timer _timer;
  int i =1;
  int current = 0;
  List<int> xAndy = [7,0];
  bool f=false;
  var c = ScrollController();
  AudioPlayer audioPlaying = AudioPlayer();
  AudioPlayer goldAudioPlaying = AudioPlayer();
  bool mute = false;

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
          if(i<path.length){
            int next = int.parse(path[i]);
            if (next == current + 1) {
              if(intTable[xAndy[0]][xAndy[1]+1]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveRigth(xAndy[0], xAndy[1]);
              current = next;
              c.jumpTo( (c.position.maxScrollExtent*(xAndy[1]+1))/8 );
              i += 1;
            }
            if (next == current - 1) {
              if(intTable[xAndy[0]][xAndy[1]-1]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveLeft(xAndy[0], xAndy[1]);
              current = next;
              c.jumpTo( (c.position.maxScrollExtent*(xAndy[1]))/8 );
              i += 1;
            }
            if (next == current + 8) {
              if(intTable[xAndy[0]-1][xAndy[1]]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveUp(xAndy[0], xAndy[1]);
              current = next;
              i += 1;
            }
            if (next == current - 8) {
              if(intTable[xAndy[0]+1][xAndy[1]]==1){
                goldAudioPlaying.play(AssetSource("gold.mp3"));
              }
              xAndy = MoveDown(xAndy[0], xAndy[1]);
              current = next;
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
        PhoneSpaceBox(0,0),
        PhoneSpaceBox(0,1),
        PhoneSpaceBox(0,2),
        PhoneSpaceBox(0,3),
        PhoneSpaceBox(0,4),
        PhoneSpaceBox(0,5),
        PhoneSpaceBox(0,6),
        PhoneSpaceBox(0,7),
      ],
      [
        PhoneSpaceBox(1,0),
        PhoneSpaceBox(1,1),
        PhoneSpaceBox(1,2),
        PhoneSpaceBox(1,3),
        PhoneSpaceBox(1,4),
        PhoneSpaceBox(1,5),
        PhoneSpaceBox(1,6),
        PhoneSpaceBox(1,7),
      ],
      [
        PhoneSpaceBox(2,0),
        PhoneSpaceBox(2,1),
        PhoneSpaceBox(2,2),
        PhoneSpaceBox(2,3),
        PhoneSpaceBox(2,4),
        PhoneSpaceBox(2,5),
        PhoneSpaceBox(2,6),
        PhoneSpaceBox(2,7),
      ],
      [
        PhoneSpaceBox(3,0),
        PhoneSpaceBox(3,1),
        PhoneSpaceBox(3,2),
        PhoneSpaceBox(3,3),
        PhoneSpaceBox(3,4),
        PhoneSpaceBox(3,5),
        PhoneSpaceBox(3,6),
        PhoneSpaceBox(3,7),
      ],
      [
        PhoneSpaceBox(4,0),
        PhoneSpaceBox(4,1),
        PhoneSpaceBox(4,2),
        PhoneSpaceBox(4,3),
        PhoneSpaceBox(4,4),
        PhoneSpaceBox(4,5),
        PhoneSpaceBox(4,6),
        PhoneSpaceBox(4,7),
      ],
      [
        PhoneSpaceBox(5,0),
        PhoneSpaceBox(5,1),
        PhoneSpaceBox(5,2),
        PhoneSpaceBox(5,3),
        PhoneSpaceBox(5,4),
        PhoneSpaceBox(5,5),
        PhoneSpaceBox(5,6),
        PhoneSpaceBox(5,7),
      ],
      [
        PhoneSpaceBox(6,0),
        PhoneSpaceBox(6,1),
        PhoneSpaceBox(6,2),
        PhoneSpaceBox(6,3),
        PhoneSpaceBox(6,4),
        PhoneSpaceBox(6,5),
        PhoneSpaceBox(6,6),
        PhoneSpaceBox(6,7),
      ],
      [
        PhoneSpaceBox(7,0),
        PhoneSpaceBox(7,1),
        PhoneSpaceBox(7,2),
        PhoneSpaceBox(7,3),
        PhoneSpaceBox(7,4),
        PhoneSpaceBox(7,5),
        PhoneSpaceBox(7,6),
        PhoneSpaceBox(7,7),
      ],
    ];

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.h,
        child: Stack(
          children: [
            ListView(
              controller: c,
              scrollDirection: Axis.horizontal,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      child: Image(image: AssetImage("assets/c6ae2f31f1.jpeg.jpg"),fit: BoxFit.fill),
                      width: 100.h,
                      height: 100.h,
                    ),
                    SizedBox(
                      width: 100.h,
                      height: 100.h,
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
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.all(10.px),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Color(0xfffba880).withOpacity(0.3),
                          border: Border.all(color: Color(0xfffba880),width: 2.px)
                      ),
                      child: MaterialButton(
                        child: Icon(Icons.arrow_back,color: Color(0xfffba880)),
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

                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PhoneChooseAlgoScreen()));
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Color(0xfffba880).withOpacity(0.3),
                          border: Border.all(color: Color(0xfffba880),width: 2.px)
                      ),
                      child: MaterialButton(
                        child: Icon(!mute?Icons.volume_up:Icons.volume_off,color: Color(0xfffba880)),
                        onPressed: ()
                        {
                          setState(() {
                            if(mute){
                              audioPlaying.resume();
                              mute = false;
                            }else{
                              audioPlaying.pause();
                              mute = true;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
