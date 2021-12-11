class Bullet extends Floater{
  public Bullet(Spaceship theShip){
    myCenterX = theShip.getMyX();
    myCenterY = theShip.getMyY();
    myXspeed = theShip.getMyXSpeed();
    myYspeed = theShip.getMyYSpeed();
    myPointDirection = theShip.getPointDirection();
    accelerate(5);
  }
  public void show(){
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    
    if(myCenterX == 500){
      myCenterX = 1000;
    }
    if(myCenterX == 0){
      myCenterX = -1000;
    }
    
    if(myCenterY == 500){
      myCenterY = 1000;
    }
    if(myCenterY == 0){
      myCenterY = -1000;
    }
    //wrap around screen    
    //if(myCenterX >width)
    //{     
    //  myCenterX = 0;    
    //}    
    //else if (myCenterX<0)
    //{     
    //  myCenterX = width;    
    //}    
    //if(myCenterY >height)
    //{    
    //  myCenterY = 0;    
    //} 
    
    //else if (myCenterY < 0)
    //{     
    //  myCenterY = height;    
    //}   
  }   
}
