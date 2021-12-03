Star[] starArray = new Star[500];
Spaceship bob = new Spaceship();
Particle[] lines = new Particle[500];
ArrayList <Asteroid> marco = new ArrayList <Asteroid>();

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
  for(int i = 0; i < 20; i++){
    marco.add(new Asteroid());
  }
  
   
  //your code here
}
public void draw() 
{
  background(0);
  for(int i = 0; i < marco.size(); i++){
    (marco.get(i)).show();
    (marco.get(i)).move();
  }
  
  for(int i = 0; i < starArray.length; i++){
    starArray[i].show();
  }
  bob.show();
  bob.move();
  //collisions
  for(int k = 0; k < marco.size(); k++){
    if(dist((float)(marco.get(k).getMyCenterX()), (float)(marco.get(k).getMyCenterY()), (float)(bob.getMyX()), (float)(bob.getMyY())) < 20){
      marco.remove(k);
      k--;
    }   
  }
  
  //your code here
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

//char aChar = 'a';
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
  //if(keyCode == 'W'){
  ////background(0);
  ////for(int i = 0; i < lines.length; i++){
  ////  lines[i].moves();
  ////  lines[i].show();
  ////}
  //  bob.hyperspace();
  //  bob.stopMoving();
  //}

  //if(keyEvent == aChar){
  //  background(240);
  //}
}
