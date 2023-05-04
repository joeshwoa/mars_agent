import 'package:flutter/material.dart';
import 'package:mars_exploration_game/screens/put_gold_screen.dart';
import 'package:mars_exploration_game/shared/shared.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../functions/copy_list_function.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key,r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image(image: AssetImage("assets/db69ac8b8f.jpeg.jpg"),fit: BoxFit.fill),
            width: 100.w,
            height: 100.h,
          ),
          Container(
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        color: Color(0xff224364).withOpacity(0.3),
                        border: Border.all(color: Color(0xffffffff),width: 2.px)
                    ),
                    child: MaterialButton(
                      child: Text("Start",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                      onPressed: (){
                        intTable= copy(originalTable);
                        modifiedTable= copy(originalTable);

                        path=[];
                        golds=[];
                        rocks=[];
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PutGoldScreen()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
