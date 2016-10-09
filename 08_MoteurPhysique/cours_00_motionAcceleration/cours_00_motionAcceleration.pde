PVector acceleration;
PVector location;
PVector velocity;
float radius;
float maxForce;
float maxSpeed;

void setup()
{
  size(500, 500, P3D);
  radius = 5;

  location = new PVector(random(radius, width-radius), random(radius, height-radius));
  velocity = new PVector(random(2.5, 5), random(2.5, 5));
  acceleration = new PVector();
  maxForce = 2.5;
  maxSpeed = 10;
}

void draw()
{

  background(0);
  updateLocation();
  ellipse(location.x, location.y, radius * 2, radius * 2);
}

void updateLocation()
{// Compute vector Point To Mouse
  PVector mouse = new PVector(mouseX, mouseY);
  PVector acceleration = PVector.sub(mouse, location);
  // Set magnitude of acceleration to max force
  acceleration.setMag(maxForce);
  // Velocity changes according to acceleration
  velocity.add(acceleration);
  // Limit the velocity by topspeed
  velocity.limit(maxSpeed);
  // Location changes by velocity
  location.add(velocity);
}