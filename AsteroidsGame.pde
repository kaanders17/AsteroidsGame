Star[] starArray = new Star[500];
Spaceship bob = new Spaceship();
Particle[] lines = new Particle[500];

public void setup() 
{
  size(500, 500);
  background(0);
  for(int i = 0; i < starArray.length; i++){
    starArray[i] = new Star();
  }
  for(int i = 0; i < lines.length; i++){
    lines[i] = new Particle();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < starArray.length; i++){
    starArray[i].show();
  }
  bob.show();
  bob.move();
  if(keyPressed){
    if(key == 'w'){
      background(0);
      for(int i = 0; i < lines.length; i++){
        //lines[i] = new Particle();
        lines[i].moves();
        lines[i].reset();
        lines[i].show();
        //lines[i].reset();
      }
      bob.hyperspace();
      bob.stopMoving();
    }
  }
}
public void keyPressed(){
  if(key == ' '){
    bob.accelerate(2);
    bob.move();
  }
  if(key == 'a'){
    bob.turn(-10);
  }
  if(key == 'd'){
    bob.turn(10);
  }
  if(key == 'z'){
    bob.accelerate(-2);
  }
  if(key == 's'){
    bob.stopMoving();
  }
}
