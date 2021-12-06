Star[] starArray = new Star[500];
Spaceship[] bob = new Spaceship[3];
Particle[] lines = new Particle[500];
ArrayList <Asteroid> marco = new ArrayList <Asteroid>();
ArrayList <SmallAsteroid> polo = new ArrayList <SmallAsteroid>();

//your variable declarations here
public void setup() 
{
  size(500, 500);
  background(0);
  for(int i = 0; i < starArray.length; i++){
    starArray[i] = new Star();
  }
  bob[0] = new Spaceship(250, 250);
  bob[1] = new Spaceship(200, 200);
  bob[2] = new Spaceship(200, 300);
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
  
  for(int i = 0; i < polo.size(); i++){
    (polo.get(i)).show();
    (polo.get(i)).move();
  }
  
  for(int i = 0; i < starArray.length; i++){
    starArray[i].show();
  }
  for(int i = 0; i < bob.length; i++){
    bob[i].show();
    bob[i].move();
  }
  
  //collisions
  for(int i = 0; i < bob.length; i++){
    for(int k = 0; k < marco.size(); k++){
      if(dist((float)(marco.get(k).getMyCenterX()), (float)(marco.get(k).getMyCenterY()), (float)(bob[i].getMyX()), (float)(bob[i].getMyY())) < 20){
        polo.add(new SmallAsteroid(marco.get(k).getMyCenterX() + 20, marco.get(k).getMyCenterX() + 20));
        polo.add(new SmallAsteroid(marco.get(k).getMyCenterX() - 20, marco.get(k).getMyCenterX() - 20));
        marco.remove(k);
        k--;
      }   
    }
    for(int k = 0; k < polo.size(); k++){
      if(dist((float)(polo.get(k).getMyCenterX()), (float)(polo.get(k).getMyCenterY()), (float)(bob[i].getMyX()), (float)(bob[i].getMyY())) < 10){
        polo.remove(k);
        k--;
      }   
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
      for(int i = 0; i < bob.length; i++){
        bob[i].stopMoving();
      }
      bob[0].hyperspace();
      bob[1] = new Spaceship(bob[0].getMyX() - 50, bob[0].getMyY() - 50, bob[0].getPointDirection());
      bob[2] = new Spaceship(bob[0].getMyX() - 50, bob[0].getMyY() + 50, bob[0].getPointDirection());
      for(int i = 0; i < 1; i++){
        marco.add(new Asteroid());
      }
    }
  }
}

//char aChar = 'a';
public void keyPressed(){
  if(key == ' '){
    for(int i = 0; i < bob.length; i++){
      bob[i].accelerate(2);
      bob[i].move();
    }
  }
  if(key == 'a'){
    for(int i = 0; i < bob.length; i++){
      bob[i].turn(-10);
    }
  }
  if(key == 'd'){
    for(int i = 0; i < bob.length; i++){
      bob[i].turn(10);
    }
  }
  if(key == 'z'){
    for(int i = 0; i < bob.length; i++){
      bob[i].accelerate(-2);
    }
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
