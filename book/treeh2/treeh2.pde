/**
 * treeh2, H Fractal, backtracing
 */

int     p  = 6;
float[] x1 = new float[p + 1];
float[] x2 = new float[p + 1];
float[] x3 = new float[p + 1];
float[] x4 = new float[p + 1];
float[] y1 = new float[p + 1];
float[] y2 = new float[p + 1];
float[] y3 = new float[p + 1];
float[] y4 = new float[p + 1];
float   a  = 0.5; // Reduction

/**
 * Set up screen 
 */
void setup() {
  
  size(640, 480);
  background(0, 0, 0);
  stroke(255);  
  noLoop(); 

}
 
/**
 * Map x coordinates to the screen width
 */
float mapX(float value) {
 return map(value, -0.6, 0.6, 0, width); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
 return map(value, -0.45, 0.45, 0, height); 
} 
 
 
/**
 * Draw fractal 
 */
void draw() {
  
  for (int m = 1; m <= pow(4, p - 1) - 1; m++) {
    
    int n = m;
    int s = p;
    
    // Backtracing
    while (n % 4 == 0) {
      n = int(n / 4);
      s = s - 1;
    }
    
    x1[s - 1] = x2[s - 1];
    x2[s - 1] = x3[s - 1];
    x3[s - 1] = x4[s - 1];    
    y1[s - 1] = y2[s - 1];
    y2[s - 1] = y3[s - 1];
    y3[s - 1] = y4[s - 1];        
    
    for (int j = s; j <= p; j++) {
      
      float x = x1[j - 1];
      float y = y1[j - 1];
      float b = pow(a, j);
      float c = a * b * 1.5;
      
      x1[j] = x + b;
      x2[j] = x + b;
      x3[j] = x - b;
      x4[j] = x - b;
      
      y1[j] = y + c;
      y2[j] = y - c;
      y3[j] = y + c;
      y4[j] = y - c;      
      
      line(mapX(x - b), mapY(y), mapX(x + b), mapY(y));
      line(mapX(x1[j]), mapY(y1[j]), mapX(x2[j]), mapY(y2[j]));
      line(mapX(x3[j]), mapY(y3[j]), mapX(x4[j]), mapY(y4[j]));
          
    }
    
  }
}


