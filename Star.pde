class Star //note that this class does NOT extend Floater
{
  private int myColor, myX, myY, mySize;
  Star(){
    myColor = 255;
    myX = (int)(Math.random()*501);
    myY = (int)(Math.random()*501);
    mySize = (int)(Math.random()*5) + 1;
  }
  public void show(){
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
  //your code here
}
