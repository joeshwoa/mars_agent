import 'package:flutter/material.dart';
import 'package:mars_exploration_game/screens/start_screen.dart';
import 'package:mars_exploration_game/shared/shared.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../componants/pressed_space_box.dart';
import '../functions/copy_list_function.dart';
import 'choose_algo_screen.dart';

class PutGoldScreen extends StatefulWidget {
  const PutGoldScreen({Key? key}) : super(key: key);

  @override
  State<PutGoldScreen> createState() => _PutGoldScreenState();
}

class _PutGoldScreenState extends State<PutGoldScreen> {

  @override
  Widget build(BuildContext context) {

    List<List<Widget>> widgetTable= [
      [
        PressedSpaceBox(0,0),
        PressedSpaceBox(0,1),
        PressedSpaceBox(0,2),
        PressedSpaceBox(0,3),
        PressedSpaceBox(0,4),
        PressedSpaceBox(0,5),
        PressedSpaceBox(0,6),
        PressedSpaceBox(0,7),
      ],
      [
        PressedSpaceBox(1,0),
        PressedSpaceBox(1,1),
        PressedSpaceBox(1,2),
        PressedSpaceBox(1,3),
        PressedSpaceBox(1,4),
        PressedSpaceBox(1,5),
        PressedSpaceBox(1,6),
        PressedSpaceBox(1,7),
      ],
      [
        PressedSpaceBox(2,0),
        PressedSpaceBox(2,1),
        PressedSpaceBox(2,2),
        PressedSpaceBox(2,3),
        PressedSpaceBox(2,4),
        PressedSpaceBox(2,5),
        PressedSpaceBox(2,6),
        PressedSpaceBox(2,7),
      ],
      [
        PressedSpaceBox(3,0),
        PressedSpaceBox(3,1),
        PressedSpaceBox(3,2),
        PressedSpaceBox(3,3),
        PressedSpaceBox(3,4),
        PressedSpaceBox(3,5),
        PressedSpaceBox(3,6),
        PressedSpaceBox(3,7),
      ],
      [
        PressedSpaceBox(4,0),
        PressedSpaceBox(4,1),
        PressedSpaceBox(4,2),
        PressedSpaceBox(4,3),
        PressedSpaceBox(4,4),
        PressedSpaceBox(4,5),
        PressedSpaceBox(4,6),
        PressedSpaceBox(4,7),
      ],
      [
        PressedSpaceBox(5,0),
        PressedSpaceBox(5,1),
        PressedSpaceBox(5,2),
        PressedSpaceBox(5,3),
        PressedSpaceBox(5,4),
        PressedSpaceBox(5,5),
        PressedSpaceBox(5,6),
        PressedSpaceBox(5,7),
      ],
      [
        PressedSpaceBox(6,0),
        PressedSpaceBox(6,1),
        PressedSpaceBox(6,2),
        PressedSpaceBox(6,3),
        PressedSpaceBox(6,4),
        PressedSpaceBox(6,5),
        PressedSpaceBox(6,6),
        PressedSpaceBox(6,7),
      ],
      [
        PressedSpaceBox(7,0),
        PressedSpaceBox(7,1),
        PressedSpaceBox(7,2),
        PressedSpaceBox(7,3),
        PressedSpaceBox(7,4),
        PressedSpaceBox(7,5),
        PressedSpaceBox(7,6),
        PressedSpaceBox(7,7),
      ],
    ];

    return Scaffold(
      body: SizedBox(
        height: 100.w,
        width: 100.w,
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Image(image: AssetImage("assets/c6ae2f31f1.jpeg.jpg"),fit: BoxFit.fill),
                  width: 100.w,
                  height: 100.w,
                ),
                Table(
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
                Padding(
                  padding: EdgeInsets.all(10.px),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            setState(() {
                              intTable= List<List<int>>.of(originalTable);
                              modifiedTable= List<List<int>>.of(originalTable);

                              path=[];
                              golds=[];
                              rocks=[];
                            });
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => StartScreen()));
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            color: Color(0xff224364).withOpacity(0.3),
                            border: Border.all(color: Color(0xffffffff),width: 2.px)
                        ),
                        child: MaterialButton(
                          child: Icon(Icons.arrow_forward,color: Color(0xffffffff)),
                          onPressed: (){
                            setState(() {
                              modifiedTable= copy(intTable);


                            });
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChooseAlgoScreen()));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
