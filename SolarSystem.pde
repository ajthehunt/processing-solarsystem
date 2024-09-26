import peasy.*;

// from Coding Train
// Part 1 - https://www.youtube.com/watch?v=l8SiJ-RmeHU
// Part 2 - https://www.youtube.com/watch?v=dncudkelNxw
// Part 3 - https://www.youtube.com/watch?v=FGAwi7wpU8c

Planet sun;

PeasyCam cam;

PImage sunTexture;
PImage [] textures = new PImage[2];

void setup () {
  size(600,600, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("earth.jpg");
  textures[1] = loadImage("moon.jpg");
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(1, 1);
}

void draw() {
 background(0);
 lights();
 //pointLight(255, 255, 255, 0, 0, 0);
 // we got rid of translate() when we added PeasyCam
 // translate(width/2, height/2); 
 sun.show();
 sun.orbit();
 
}
