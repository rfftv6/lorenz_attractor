// May2016 Raffet Velarde
//
// Learning processing with Daniel Shiffman
// youtube channel
// https://www.youtube.com/watch?v=f0lkz2gSsIk
// This is a relatively simple sketch to setup
//
// The differential equations, cosntants and seeding
// points were selected from
// https://en.wikipedia.org/wiki/Lorenz_system
//*************************************************

//Peasy library allows to rotate the screen 3D
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;
PeasyCam cam;

// seed values for x, y, z
// changing these values can dramatically change
// the output of the function
// it's a good idea to print the output of the 
// differential equations to evaluate if the 
// seeding points work or not
//
float x = 0.1;
float y = 0;
float z = 0;

// constant values of the differential equations
// these values can change dramatically the output
// of the differential equations
//
float a = 10;
float b = 28;
float c = 8.0/3.0;

// 
ArrayList<PVector> points = new ArrayList<PVector>();



void setup() {
  size (800, 600, P3D);
  //
  colorMode(HSB);
  cam = new PeasyCam(this, 500);



  //  background(0);
}

void draw() {
  background(0);

  // setting up the step value of dt
  float dt = 0.01;

  // setting up the differential equations
  float dx= (a * (y - x)) * dt;
  float dy= (x * (b - z) - y) * dt;
  float dz= (x * y - c * z) * dt;

  // setting up the step of x,y,z
  x = x + dx;
  y = y + dy;
  z = z + dz;

  points.add(new PVector(x, y, z));

  // At the beginning of the tutorial translate() at half the 
  // seems to work well.  I'm not sure why it was tranlated
  // 
  translate(0, 0, -80);
  // translate(width/2, height/2);

  // scale() large values gives a very coarse drawing of the fucntion being drawn
  scale(1);

  //stroke(255);
  noFill();

  float hu = 0;
  
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    //vertex(v.x, v.y, v.z);
        point(v.x, v.y, v.z);
  //  PVector offset = PVector.random3D();
    //offset.mult(0.1);
   // v.add(offset);
    hu += 0.1;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();

  // point(x, y);
  // println(x, y, z);
}