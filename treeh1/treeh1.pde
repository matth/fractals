/**
 * treeh1, H Fractal
 */
 
int p = 9;             // Order
float a = sqrt(0.5);   // Reduction
float[] x = new float[2048];
float[] y = new float[2048];

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
 * Draw fractal 
 */
void draw() {
  
  x[1] = 0.0;
  y[1] = 0.0;
  
  for (int m = 0; m <= p; m++) {
    
    int s = m % 2;

    for (int n = int(pow(2, m)); n <= int(pow(2, m + 1)) - 1; n++) {

      if (s == 1) {
        x[2 * n]     = x[n];
        y[2 * n]     = y[n] + pow(a, m);
        x[2 * n + 1] = x[n];
        y[2 * n + 1] = y[n] - pow(a, m);
      } else {
        x[2 * n]     = x[n] + pow(a, m);
        y[2 * n]     = y[n];
        x[2 * n + 1] = x[n] - pow(a, m);
        y[2 * n + 1] = y[n];
      } 
      
    }
    
  }
  
  for (int n = 1; n <= int(pow(2, p + 1) - 1); n++) {
    float x1 = map(x[2 * n], -2.4, 2.4, 0, width);
    float y1 = map(y[2 * n], -1.8, 1.8, 0, height);
    float x2 = map(x[2 * n + 1], -2.4, 2.4, 0, width);
    float y2 = map(y[2 * n + 1], -1.8, 1.8, 0, height);
    line(x1, y1, x2, y2); 
  }
  
}

