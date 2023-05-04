import '../shared/shared.dart';

List<int> MoveUp(int x,int y) {
  intTable[x][y]=0;
  intTable[x-1][y]=-1;
  return [x-1,y];
}
List<int> MoveDown(int x,int y) {
  intTable[x][y]=0;
  intTable[x+1][y]=-1;
  return [x+1,y];
}
List<int> MoveRigth(int x,int y) {
  intTable[x][y]=0;
  intTable[x][y+1]=-1;
  return [x,y+1];
}
List<int> MoveLeft(int x,int y) {
  intTable[x][y]=0;
  intTable[x][y-1]=-1;
  return [x,y-1];
}
