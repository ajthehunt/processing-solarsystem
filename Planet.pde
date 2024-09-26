class Planet {
 float radius;
 float angle;
 float distance;
 Planet[] planets;
 float orbitSpeed;
 PVector v;
 
 PShape globe;
 
 Planet(float r, float d, float o, PImage img) {
   v = PVector.random3D();
   
   radius = r;
   distance = d;
   v.mult(distance);
   angle = random(TWO_PI);
   orbitSpeed = o;
   
   noStroke();
   noFill();
   globe = createShape(SPHERE, radius);
   globe.setTexture(img);
 }
 
 void orbit() {
     angle += orbitSpeed;
     if (planets != null) {
       for (int i = 0; i < planets.length; i++) {
         planets[i].orbit(); 
       }
     }
 }
 
 
 void spawnMoons(int total, int level) {
  planets = new Planet[total];
  for (int i = 0; i < planets.length; i++) {
    float r = radius/(level*2);
    float d = random(radius + r, 2*(radius + r));
    float o = 100 / pow(d, 2); // not what Coding Train did: random(0.02, 0.03)
    int texture = int(random(textures.length));
    planets[i] = new Planet(r, d, o, textures[texture]);
    if (level < 2) {
      int num = 1;//int(random(0,3));
      planets[i].spawnMoons(num, level + 1);
    }
  }
 }
 
 void show() {
   pushMatrix();
   noStroke();
   
   // v2 is an arbitrarily chosen unit vector
   PVector v2 = new PVector(1,0,1);
   // p is a vector perpendicular to v and v2, about which the planet will rotate
   PVector p = v.cross(v2);
   rotate(angle, p.x, p.y, p.z);
   stroke(255);
   
   //line connecting sun --> planets --> moons 
   line(0, 0, 0, v.x, v.y, v.z);
   
   // perpendicular vector (axis of orbit)
   line(0, 0, 0, p.x, p.y, p.z);
   
   noStroke();
   translate(v.x, v.y, v.z);
   fill(255);
   shape(globe);
   //sphere(radius);
   //ellipse(0, 0, radius * 2, radius * 2); 
   if (planets != null) {
     for (int i = 0; i < this.planets.length; i++) {
       this.planets[i].show();
     }
   }
   popMatrix();
 }
  
}
