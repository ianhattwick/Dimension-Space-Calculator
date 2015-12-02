void saveSpace() { 
  outName2[0] = newItem;
  String period=".";
  int periodIndex=outName2[0].indexOf(period);
  outName2[0]=outName2[0].substring(0,periodIndex);
  outName3=join(outName2,".");
  print("File Saved as: ");
  println(outName3);
}
