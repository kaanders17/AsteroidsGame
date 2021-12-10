Star[] starArray = new Star[500];
Spaceship[] bob = new Spaceship[3];
Particle[] lines = new Particle[500];
ArrayList <Asteroid> marco = new ArrayList <Asteroid>();
ArrayList <SmallAsteroid> polo = new ArrayList <SmallAsteroid>();
ArrayList <Bullet> shots = new ArrayList <Bullet>();
int score = 0;

//your variable declarations here
public void setup() 
{
  size(500, 500);
  background(0);
  for(int i = 0; i < starArray.length; i++){
    starArray[i] = new Star();
  }
  bob[0] = new Spaceship(250, 250);
  bob[1] = new Spaceship(225, 225);
  bob[2] = new Spaceship(225, 275);
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
  for(int i = 0; i < shots.size(); i++){
    if(shots.get(i).getMyX() < 500){
      shots.get(i).move();
      shots.get(i).show();
    }
  }
  
  
  //collisions
  for(int i = 0; i < bob.length; i++){
    for(int k = 0; k < marco.size(); k++){
      if(dist((float)(marco.get(k).getMyCenterX()), (float)(marco.get(k).getMyCenterY()), (float)(bob[i].getMyX()), (float)(bob[i].getMyY())) < 20){
        polo.add(new SmallAsteroid(marco.get(k).getMyCenterX() + 25, marco.get(k).getMyCenterX() + 25));
        polo.add(new SmallAsteroid(marco.get(k).getMyCenterX() - 25, marco.get(k).getMyCenterX() - 25));
        marco.remove(k);
        k--;
         
        //score--;
      }   
    }
    for(int k = 0; k < polo.size(); k++){
      if(dist((float)(polo.get(k).getMyCenterX()), (float)(polo.get(k).getMyCenterY()), (float)(bob[i].getMyX()), (float)(bob[i].getMyY())) < 10){
        polo.remove(k);
        k--;
        //score--;
        
      }   
    }
  }
  
  for(int i = 0; i < shots.size(); i++){
    for(int k = 0; k < marco.size(); k++){
      if(dist((float)(marco.get(k).getMyCenterX()), (float)(marco.get(k).getMyCenterY()), (float)(shots.get(i).getMyX()), (float)(shots.get(i).getMyY())) < 10){
        fill(255, 255, 0);
        starExplosion((float)marco.get(k).getMyCenterX(), (float)marco.get(k).getMyCenterY(), 20, 40, 10);
        marco.remove(k);
        k--;
        score++;
      }   
    }
    for(int k = 0; k < polo.size(); k++){
      if(dist((float)(polo.get(k).getMyCenterX()), (float)(polo.get(k).getMyCenterY()), (float)(shots.get(i).getMyX()), (float)(shots.get(i).getMyY())) < 10){
        fill(255, 255, 0);
        starExplosion((float)polo.get(k).getMyCenterX(), (float)polo.get(k).getMyCenterY(), 20, 40, 10);
        polo.remove(k);
        k--;
        score++;
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
      bob[1] = new Spaceship(bob[0].getMyX() - 25, bob[0].getMyY() - 25, bob[0].getPointDirection());
      bob[2] = new Spaceship(bob[0].getMyX() - 25, bob[0].getMyY() + 25, bob[0].getPointDirection());
      for(int i = 0; i < 1; i++){
        marco.add(new Asteroid());
      }
    }
  }
  fill(255);
  rect(10, 10, 120, 90, 28);
  fill(0);
  rect(15, 15, 110, 80, 28);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Score: " + score, 70, 50);
  if(score >= 20){
    score = 100;
    fill(0);
    rect(0, 0, 500, 500);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Gameover! You win!", 250, 200);
    textSize(15);
    textAlign(CENTER);
    text("Refresh to restart", 250, 250);
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
}
  
  public void keyReleased(){
    if(key == 's'){
    shots.add(new Bullet(bob[0]));
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
  
  //Explosion
  void starExplosion(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
