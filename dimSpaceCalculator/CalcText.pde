void drawAxisName(int num, String s) {
 
  float angle =TWO_PI/numAxes;
  float initialAngle=angle;
  int initial=0;
  int axisOffset=(int)(axisLength*axisLabelMin);
  int curAxisLength=axisLength-axisOffset;

  if(num==0) initial=0;
  angle = (angle*(num)) +4.712389 +(initial*(angle*2));
  angle=angle%TWO_PI;

//DRAW NAMES
  textFont(f,axisNameSize);
  fill(axisNameColor[0],axisNameColor[1],axisNameColor[2]);

  if(angle<1.5708||angle>4.712389) { 
    rotate(angle);
    textAlign(CENTER);
    text(s,0,axisLength*nameDisplacement);
  //  point(0,axisLength*0.5);
    rotate(-angle);
  }
  
  else {
    rotate(angle+PI);
    textAlign(CENTER);
    text(s,0, 0-(axisLength)*nameDisplacement+axisNameSize/2);
   // point(0,-axisLength*0.5);
    rotate(-angle+PI);
  }
  
  //DRAW LABELS
  textFont(f,axisLabelSize);
  fill(axisLabelColor[0],axisLabelColor[1],axisLabelColor[2]);
  
  //get number of labels
  int curNumLabels=0;
  for(int i=0;i<axisInput.getColumnCount();i++){
      if(axisInput.getString(num,i)!=null){
        curNumLabels++;
    }
  }
  curNumLabels-=1;
  // println(curNumLabels);
  
  for(int i=0;i<curNumLabels;i++){
  
    if(angle<0||angle>3.14) {  
      
      rotate(angle+1.5708);
      if(i==0) {  //min value
        textAlign(RIGHT);
        text(axisInput.getString(num,1),
          axisLength*axisLabelMin,
          -axisLabelOffset);
      }
      else if(i==curNumLabels-1){ //max value
        textAlign(RIGHT);
        text(axisInput.getString(num,curNumLabels),
          axisLength*1,
          -axisLabelOffset);
      } 
      else { //middle values
        textAlign(RIGHT);
        text(axisInput.getString(num,i+1),
        
          (((float)(i-0)/(curNumLabels-1)) * ((float)curAxisLength/axisLength) + ((float)axisOffset/axisLength))*axisLength,

          -axisLabelOffset);
      }

          
        rotate(-(angle+1.5708));
    }
  
    
    else {
      rotate(angle+4.712389);
      
      if(i==0) {
        textAlign(LEFT);
        text(axisInput.getString(num,1),
          -axisLength*axisLabelMin,
          axisLabelOffset+axisLabelSize/2);
      }
      else if(i==curNumLabels-1){
        textAlign(LEFT);
        text(axisInput.getString(num,curNumLabels),
          -axisLength*1,
          axisLabelOffset+axisLabelSize/2);
      }
      else {
        textAlign(LEFT);
        text(axisInput.getString(num,i+1),
          -(((float)(i-0)/(curNumLabels-1)) * ((float)curAxisLength/axisLength) + ((float)axisOffset/axisLength))*axisLength,
          axisLabelOffset+axisLabelSize/2);
      }
      
      rotate(-(angle+4.712389));
    }
  }
}
