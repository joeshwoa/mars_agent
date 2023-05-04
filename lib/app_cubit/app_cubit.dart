import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool firstChangeSpaceBox = true;

  void ChangeSpaceBox ()
  {
    if(firstChangeSpaceBox)
    {
      firstChangeSpaceBox=false;
      emit(ChangeSpaceBoxTrue());
    }
    if(!firstChangeSpaceBox)
    {
      firstChangeSpaceBox=true;
      emit(ChangeSpaceBoxFalse());
    }
  }


}
