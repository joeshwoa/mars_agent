import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_exploration_game/app_cubit/app_cubit.dart';
import 'package:mars_exploration_game/shared/shared.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhonePressedSpaceBox extends StatelessWidget {
  PhonePressedSpaceBox(this.x,this.y,{Key? key}) : super(key: key);

  late int x,y;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45,
                    width: 0.5.px,
                  )
              ),
              width: (100/8).h,
              height: (100/8).h,
              child: intTable[x][y] > -1?
              MaterialButton(
                  onPressed: (){
                    if(intTable[x][y]<2)
                    {
                      intTable[x][y] +=1;
                      if(intTable[x][y] == 1)
                      {
                        int i = 56-8*x+y ;
                        golds.add(i.toString());
                      }
                      if(intTable[x][y] == 2)
                      {
                        int i = 56-8*x+y ;
                        golds.remove(i.toString());
                        rocks.add(i.toString());
                      }
                      AppCubit.get(context).ChangeSpaceBox();
                    }else
                    {
                      int i = 56-8*x+y ;
                      golds.remove(i.toString());
                      rocks.remove(i.toString());
                      intTable[x][y] =0;
                      AppCubit.get(context).ChangeSpaceBox();
                    }
                  },
                  child: intTable[x][y] == 0? SizedBox():
                  intTable[x][y] == 1?Image(image: AssetImage("assets/1000125298-removebg-preview.png"),):
                  Image(image: AssetImage("assets/1000125299-removebg-preview.png"),)
              ):
              intTable[x][y] != -1? Image(image: AssetImage("assets/Picsart_23-05-01_11-53-08-723.png"),):
              Image(image: AssetImage("assets/1000125297-removebg-preview.png"),)
          );
        },
      ),
    );
  }
}
