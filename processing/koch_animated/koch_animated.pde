/**
 * koch_animated, Animated Koch curve, based on the file koch from the
 * book "Fractals: Images of chaos"
 */

/**
 * Set up screen 
 */
void setup() {
  
  size(640, 480);
  background(0, 0, 0);
  stroke(255);  
  frameRate(1);

}
 
/**
 * Map x coordinates to the screen width
 */
float mapX(float value) {
 return map(value, -0.1, 1.1, width, 0); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
 return map(value, -0.4, 0.5, height, 0); 
}  

/**
 * Number of iterations
 */
int count = 0;
  
/**
 * Draw fractal 
 */
void draw() {
  if (count <= 5) {
    drawKoch(count);
    count++;
  } else {
    noLoop(); 
  }
}

void drawKoch(int p) {
  
  background(0);
  
  float x = 0.0;
  float y = 0.0;
  
  float[] t = new float[p];
  float   h = pow(3, -p);    // Length of each segment 
  
  for (int n = 0; n <= pow(4, p) - 1; n++) {
    
    int m = n; // Quaternary notation of n 
    
    for (int l = 0; l < p; l++) {
      t[l] = m % 4;
      m = m / 4; 
    }
  
    float s = 0;
    
    for (int k = 0; k < p; k++) {
      s = s + (t[k] + 1) % 3 - 1; 
    }
    
    float old_x = x;
    float old_y = y;
    
    x = old_x + cos(PI * s / 3) * h;
    y = old_y + sin(PI * s / 3) * h;   
   
    line(mapX(old_x), mapY(old_y), mapX(x), mapY(y));

  }
 
}



