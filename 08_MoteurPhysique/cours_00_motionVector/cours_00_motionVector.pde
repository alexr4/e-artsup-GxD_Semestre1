PVector location;
PVector velocity;
float radius;

void setup()
{
  size(500, 500, P3D);
  radius = 20;
  
  location = new PVector(random(radius, width-radius), random(radius, height-radius));
  velocity = new PVector(random(2.5, 5), random(2.5, 5));
}

void draw()
{
  background(0);
  
  updateLocation();
  checkEdge();
  ellipse(location.x, location.y, radius * 2, radius * 2);
}

void updateLocation()
{
  //Add the speed at fram f to the location vector
  location.add(velocity);
}

void checkEdge()
{
  if(location.x > width - radius || location.x < 0 + radius)
  {
    velocity.x = velocity.x * -1;
  }
  
  if(location.y > height - radius || location.y < 0 + radius)
  {
    velocity.y = velocity.y * -1;
  }
}