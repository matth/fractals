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
  frameRate(2);

}
 
/**
 * Map x coordinates to the screen width
 */
float mapX(float value) {
 return map(value, -0.1, 1.1, 0, 180); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
 return map(value, -0.4, 0.5, 0, 120); 
}  

/**
 * Number of iterations
 */
int count = 0;
  
/**
 * Draw fractal 
 */
void draw() {

  if (count <=  5) {
    background(0);
    pushMatrix();
    translate(width / 2, 50);   
    rotate(radians(60));       
    drawKoch(count);      
    rotate(radians(-120));       
    scale(-1.0, 1.0);
    drawKoch(count);     
    popMatrix(); 
    pushMatrix();  
    translate(width / 2 - 150, 310);   
    scale(1.0, -1.0);  
    drawKoch(count);        
    popMatrix();
    count++;
  } else {
   noLoop(); 
  }
}

void drawKoch(int p) {
    
  float x = 0.0;
  float y = 0.0;
  
  int[] t = new int[p];
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

    float[] a = new float[4];
    
    a[0] = 0;
    a[1] = PI / 3;
    a[2] = -(PI / 3);
    a[3] = 0;
    
    float angle = 0.0;
    
    for (int g = 0; g < p; g++) {
      angle += a[t[g]];   
    }
    
    float old_x = x;
    float old_y = y;
       
//    x = old_x + cos(PI * s / 3) * h;
//    y = old_y + sin(PI * s / 3) * h;   
    x = old_x + cos(angle) * h;
    y = old_y + sin(angle) * h;    

//    line(mapX(old_x), mapY(old_y), mapX(x), mapY(y));
    line(old_x * 300, old_y * 300, x * 300, y * 300);

  }
 
}



