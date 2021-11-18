Star[] starArray = new Star[200];
Spaceship bob = new Spaceship();
Particle[] lines = new Particle[150];

//your variable declarations here
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
  
   
  //your code here
}
public void draw() 
{
  background(0);
  for(int i = 0; i < starArray.length; i++){
    starArray[i].show();
  }
  bob.show();
  bob.move();
  //your code here
}

//char aChar = 'a';
public void keyPressed(){
  if(key == ' '){
    bob.accelerate(5);
    bob.move();
  }
  if(keyCode == 'A'){
    bob.turn(-10);
  }
  if(keyCode == 'D'){
    bob.turn(10);
  }
if(keyCode == 'W'){
  background(0);
  for(int i = 0; i < lines.length; i++){
    lines[i].moves();
    lines[i].show();
  }
    bob.hyperspace();
    bob.stopMoving();
  }

  //if(keyEvent == aChar){
  //  background(240);
  //}
}

