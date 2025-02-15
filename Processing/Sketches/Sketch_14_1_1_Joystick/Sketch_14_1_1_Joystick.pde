/*****************************************************
 * Filename    : Sketch_14_1_1_Joystick
 * Description : Display the position of the joystick
 * auther      : www.freenove.com
 * modification: 2024/09/03
 *****************************************************/
import freenove.processing.io.*;
//Create a object of class ADCDevice
ADCDevice adc = new ADCDevice();
int cx, cy, cd, cr;    //define the center point,side length & half.
void setup() {
  size(640, 360);
  if (adc.detectI2C(0x48)) {
    adc = new ADS7830(0x48);
  } else {
    println("Not found ADC Module!");
    System.exit(-1);
  }
  cx = width/2;    //center of the display window
  cy = height/2;    //
  cd = (int)(height/1.5);
  cr = cd /2;
}
void draw() {
  int x=0, y=0;
  x = adc.analogRead(5);  //read the ADC of joystick
  y = adc.analogRead(6);  //

  background(102);
  titleAndSiteInfo();
  fill(0);
  textSize(20);
  textAlign(LEFT, TOP);
  text("X:"+x+"\nY:"+y, 10, 10);

  fill(255);    //wall color
  rect(cx-cr, cy-cr, cd, cd);    
  ellipse(map(x, 255, 0, cx-cr, cx+cr), map(y, 255, 0, cy-cr, cy+cr), 50, 50);
}
void titleAndSiteInfo() {
  fill(0);
  textAlign(CENTER);    //set the text centered
  textSize(40);        //set text size
  text("Joystick", width / 2, 40);    //title
  textSize(16);
  text("www.freenove.com", width / 2, height - 20);    //site
}
