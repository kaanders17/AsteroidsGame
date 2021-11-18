class Star //note that this class does NOT extend Floater
{
  private int myColor, myX, myY, mySize, myOpacity;
  Star(){
    myColor = 255;
    myX = (int)(Math.random()*501);
    myY = (int)(Math.random()*501);
    mySize = (int)(Math.random()*4) + 1;
    myOpacity = (int)(Math.random()*120)+100;
  }
  public void show(){
    noStroke();
    fill(myColor, myOpacity);
    ellipse(myX, myY, mySize, mySize);
  }
  //your code here
}
