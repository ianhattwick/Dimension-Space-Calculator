/**
Dimension Space Calculator
by Ian Hattwick June 2015
ianhattwick.com

Input:
axisSetup: creates axes, names, and labels. Sample: "animals.csv"
newItem: inputs values for a new item. Samples: "jan.csv" and "pete.csv"
Output:
a tif file with the same name as the newItem file, located in the sketch folder.

Also check the values of "Basic parameters" to customize your space.
 */
 
 import processing.pdf.*;

String axisSetup="animals.csv";
String newItem="pete.csv";

//String axisSetup="dissTest.csv";
//String newItem="ilinx.csv";


//sample input files
//String axisSetup="animals.csv";
//String newItem="pete.csv";

//BASIC PARAMETERS
int dimensions[]={400,400}; //size of output image
float borderSize=0.9; //scale size of image to create a border
String thisFont="Utopia-Regular"; //font for names and labels
int printFonts=0;
int axisNameSize=16;
int axisNameColor[]={100 ,0,0};
float nameDisplacement=1.08; //displacement from end of axes
int axisLabelSize=12; 
int axisLabelColor[]={0,0,0};
int axisLabelOffset=2; //label offset from axes
float axisLabelMin=.3; //scaling for location of label for minimum value

int axisThickness=2; 
int axisColor[]={0,0,0};
int pointSize=8;
int pointColor[]={0,0,0};
int webLineColor[]={150,150,150}; //color of lines connecting points
int webThickness=1; //thickness of lines connecting points
int webFillColor[]={230,200,200}; //opacity of fill area inside lines connecting points

//GLOBAL VARIABLES
Table axisInput;
Table itemInput;
PFont f;
int centerX;
int centerY;
int numAxes=6;
int axisLength;

int[] eachAxisEnd= new int[2];
int[] pointX=new int[20];
int[] pointY=new int[20];
float curValue;
String outName2[]={"name","pdf"};
String outName3;

//SETUP
void setup(){
  noLoop();
  axisInput = loadTable(axisSetup);
  itemInput = loadTable(newItem);
  numAxes=axisInput.getRowCount(); //number of axes is dependent upon the number of lines in axisInput
  saveSpace();
  size(dimensions[0],dimensions[1], PDF, outName3);
  //size(dimensions[0],dimensions[1]); //image size
  
  f = createFont(thisFont,16,true);
String[] fontList = PFont.list();
if(printFonts==1)println(fontList);
  axisLabelOffset=axisLabelOffset+(int)(axisLabelSize*0.5);
  
 centerX = height/2;
 centerY = width/2;
 axisLength = int((float)height*borderSize/2);
 background(255); //white
 noFill();

  stroke(255); //white
  
  //draw points
  for (int i=0;i<numAxes;i++)calcPoints(i);
  for (int i=0;i<numAxes;i++)drawPolygon(i);
  for (int i=0;i<numAxes;i++)drawPoint(i);
  
  
  //draw lines
  for (int i=0;i<numAxes;i++) { 
    calcEndpoints(i);
    stroke(axisColor[0],axisColor[1],axisColor[2]);
    strokeWeight(axisThickness);
    line(centerY, centerX, eachAxisEnd[1], eachAxisEnd[0]);
  }
  
  //draw text
  translate(centerX,centerY);
  for (int i=0;i<numAxes;i++) {
  drawAxisName(i, axisInput.getString(i,0));
  }
}
//END SETUP

//DRAW - UNUSED
void draw(){
exit();
}
