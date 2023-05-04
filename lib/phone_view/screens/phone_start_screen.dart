import 'package:flutter/material.dart';
import 'package:mars_exploration_game/functions/copy_list_function.dart';
import 'package:mars_exploration_game/phone_view/screens/phone_put_gold_screen.dart';
import 'package:mars_exploration_game/shared/shared.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class PhoneStartScreen extends StatelessWidget {
  const PhoneStartScreen({Key? key,r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image(image: AssetImage("assets/163308_original_3240x5760.jpg"),fit: BoxFit.fill),
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
                    width: 30.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        color: Color(0xfffba880).withOpacity(0.3),
                        border: Border.all(color: Color(0xfffba880),width: 2.px)
                    ),
                    child: MaterialButton(
                      child: Text("Start",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                      onPressed: (){
                        intTable= copy(originalTable);
                        modifiedTable= copy(originalTable);


                        path=[];
                        golds=[];
                        rocks=[];
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PhonePutGoldScreen()));
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
