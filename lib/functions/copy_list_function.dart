copy(List<List<int>>o)
{
  List<List<int>> c = [];
  for(int i=0;i<o.length;i++){
    c.add(o[i].toList());
  }
  return c;
}