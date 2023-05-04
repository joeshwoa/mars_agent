part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeSpaceBoxTrue extends AppState {}
class ChangeSpaceBoxFalse extends AppState {}