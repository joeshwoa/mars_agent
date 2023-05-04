import 'package:flutter/material.dart';
import 'package:mars_exploration_game/functions/copy_list_function.dart';
import 'package:mars_exploration_game/phone_view/componants/phone_pressed_space_box.dart';
import 'package:mars_exploration_game/phone_view/screens/phone_choose_algo_screen.dart';
import 'package:mars_exploration_game/phone_view/screens/phone_start_screen.dart';
import 'package:mars_exploration_game/shared/shared.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhonePutGoldScreen extends StatefulWidget {
  const PhonePutGoldScreen({Key? key}) : super(key: key);

  @override
  State<PhonePutGoldScreen> createState() => _PhonePutGoldScreenState();
}

class _PhonePutGoldScreenState extends State<PhonePutGoldScreen> {

  @override
  Widget build(BuildContext context) {

    List<List<Widget>> widgetTable= [
      [
        PhonePressedSpaceBox(0,0),
        PhonePressedSpaceBox(0,1),
        PhonePressedSpaceBox(0,2),
        PhonePressedSpaceBox(0,3),
        PhonePressedSpaceBox(0,4),
        PhonePressedSpaceBox(0,5),
        PhonePressedSpaceBox(0,6),
        PhonePressedSpaceBox(0,7),
      ],
      [
        PhonePressedSpaceBox(1,0),
        PhonePressedSpaceBox(1,1),
        PhonePressedSpaceBox(1,2),
        PhonePressedSpaceBox(1,3),
        PhonePressedSpaceBox(1,4),
        PhonePressedSpaceBox(1,5),
        PhonePressedSpaceBox(1,6),
        PhonePressedSpaceBox(1,7),
      ],
      [
        PhonePressedSpaceBox(2,0),
        PhonePressedSpaceBox(2,1),
        PhonePressedSpaceBox(2,2),
        PhonePressedSpaceBox(2,3),
        PhonePressedSpaceBox(2,4),
        PhonePressedSpaceBox(2,5),
        PhonePressedSpaceBox(2,6),
        PhonePressedSpaceBox(2,7),
      ],
      [
        PhonePressedSpaceBox(3,0),
        PhonePressedSpaceBox(3,1),
        PhonePressedSpaceBox(3,2),
        PhonePressedSpaceBox(3,3),
        PhonePressedSpaceBox(3,4),
        PhonePressedSpaceBox(3,5),
        PhonePressedSpaceBox(3,6),
        PhonePressedSpaceBox(3,7),
      ],
      [
        PhonePressedSpaceBox(4,0),
        PhonePressedSpaceBox(4,1),
        PhonePressedSpaceBox(4,2),
        PhonePressedSpaceBox(4,3),
        PhonePressedSpaceBox(4,4),
        PhonePressedSpaceBox(4,5),
        PhonePressedSpaceBox(4,6),
        PhonePressedSpaceBox(4,7),
      ],
      [
        PhonePressedSpaceBox(5,0),
        PhonePressedSpaceBox(5,1),
        PhonePressedSpaceBox(5,2),
        PhonePressedSpaceBox(5,3),
        PhonePressedSpaceBox(5,4),
        PhonePressedSpaceBox(5,5),
        PhonePressedSpaceBox(5,6),
        PhonePressedSpaceBox(5,7),
      ],
      [
        PhonePressedSpaceBox(6,0),
        PhonePressedSpaceBox(6,1),
        PhonePressedSpaceBox(6,2),
        PhonePressedSpaceBox(6,3),
        PhonePressedSpaceBox(6,4),
        PhonePressedSpaceBox(6,5),
        PhonePressedSpaceBox(6,6),
        PhonePressedSpaceBox(6,7),
      ],
      [
        PhonePressedSpaceBox(7,0),
        PhonePressedSpaceBox(7,1),
        PhonePressedSpaceBox(7,2),
        PhonePressedSpaceBox(7,3),
        PhonePressedSpaceBox(7,4),
        PhonePressedSpaceBox(7,5),
        PhonePressedSpaceBox(7,6),
        PhonePressedSpaceBox(7,7),
      ],
    ];

    return Scaffold(
      body: SizedBox(
          height: 100.h,
          width: 100.h,
          child: Stack(
            children: [
              ListView(
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
              Padding(
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
                          setState(() {
                            intTable= List<List<int>>.of(originalTable);
                            modifiedTable= List<List<int>>.of(originalTable);

                            path=[];
                            golds=[];
                            rocks=[];
                          });
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PhoneStartScreen()));
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
                        child: Icon(Icons.arrow_forward,color: Color(0xfffba880)),
                        onPressed: (){
                          setState(() {
                            modifiedTable= copy(intTable);


                          });
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PhoneChooseAlgoScreen()));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
