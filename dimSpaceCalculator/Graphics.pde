
//DRAW LINES
void calcEndpoints(int num){
  //see http://www.regentsprep.org/regents/math/algebra/AT2/Ltrig.htm
  float angle =TWO_PI/numAxes;
  angle = (angle*num) + (0);
  eachAxisEnd[0] = int(sin(angle)*axisLength)+centerX;
  eachAxisEnd[1] = int(cos(angle)*axisLength)+centerY;
  //draw points
  //calcPoints(num);

}

//DRAW POINTS
void calcPoints(int num) {
  //calculate geometry
  float angle =TWO_PI/numAxes;
  angle = (angle*num) + (0);
  int axisOffset=(int)(axisLength*axisLabelMin);
  int curAxisLength=axisLength-axisOffset;
  
  //get number of labels for this axis
  int curNumLabels=0;
  curValue=0;
  for(int i=1;i<axisInput.getColumnCount();i++){
      if(axisInput.getString(num,i)!=null) curNumLabels++;
     }
  
  //determine mode of labels and min and max values - mode 0= numbers, mode 1=text label/number value, mode 2=text label&value
  int axisMode,axisMinVal,axisMaxVal;
 if (axisInput.getString(num,1).charAt(0) >='0' && axisInput.getString(num,1).charAt(0) <= '9') {
   axisMode=0;
   axisMinVal=parseInt(axisInput.getString(num,1));
   axisMaxVal=parseInt(axisInput.getString(num,curNumLabels));
   curValue=parseInt(itemInput.getString(num,1));
   curValue=(curValue-axisMinVal)/(axisMaxVal-axisMinVal);
 }
 else if (itemInput.getString(num,1).charAt(0) >='0' && itemInput.getString(num,1).charAt(0) <= '9') { //value from 0-100
   axisMode=1;
   axisMinVal=0;
   axisMaxVal=100;
   curValue=parseInt(itemInput.getString(num,1));
   curValue=(curValue-axisMinVal)/(axisMaxVal-axisMinVal);
 }
 else {
   axisMode=2;
   axisMinVal=0;
   axisMaxVal=curNumLabels-1;
   
    //find value of this axis
    for(int j=0;j<curNumLabels+1;j++) {  
      String tempAxis=axisInput.getString(num,j);
      String tempItem=itemInput.getString(num,1);  
      if(tempAxis.equals(tempItem)) curValue=(float)j;
    }
    curValue-=1;
    curNumLabels-=1;
    curValue=(curValue)/(curNumLabels);
  }
  
  //scale curValue
  curValue=(curValue*((float)curAxisLength/axisLength))+(float)((float)axisOffset/axisLength);

  //set point location
  pointX[num]=int(sin(angle)*axisLength*curValue)+centerX;
  pointY[num] = int(cos(angle)*axisLength*curValue)+centerY;
  
}

void drawPoint(int num){
  stroke(pointColor[0],pointColor[1],pointColor[2]);
  strokeWeight(pointSize);
  point(pointY[num],pointX[num]);
}

//DRAW POLYGON
void drawPolygon(int i){
  stroke(webLineColor[0],webLineColor[1],webLineColor[2]);
  strokeWeight(webThickness);

    fill(webFillColor[0],webFillColor[1],webFillColor[2]);
    triangle(centerX,centerY,pointY[i],pointX[i],pointY[(i+1)%numAxes],pointX[(i+1)%numAxes]);
  
}
