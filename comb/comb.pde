/**
 * comb, Cantor Comb
 */

float[] a = new float[729];
float[] b = new float[729];
float B = 0.1;

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
  return map(value, -0.3, 1.3, 0, width); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
  return map(value, -0.4, 0.8, 0, height); 
} 
 
 
/**
 * Draw fractal 
 */
void draw() {
  
  a[0] = 0;
  a[1] = 1;
  
  line(mapX(0), mapY(0), mapX(1), mapY(0));
  line(mapX(1), mapY(0), mapX(1), mapY(-B));
  line(mapX(1), mapY(-B), mapX(0), mapY(-B));
  line(mapX(0), mapY(-B), mapX(0), mapY(0));

  for (int p = 1; p <= 6; p++) {
    
    for (int i = 0; i <= pow(2, p) - 1; i++) {
      b[i] = a[i] / 3;
      b[i + int(pow(2, p))] = 1 - (1 - a[i]) / 3;
    } 
    
    for (int j = 1; j <= pow(2, p + 1) - 1; j++) {
      a[j] = b[j];
    } 
    
    for (int k = 0; k <= pow(2, p + 1) - 1; k = k + 2) {
      line(mapX(a[k]), mapY(B * p), mapX(a[k + 1]), mapY(B * p));
      line(mapX(a[k]), mapY(B * p), mapX(a[k]), mapY(B * p - B));
      line(mapX(a[k + 1]), mapY(B * p), mapX(a[k + 1]), mapY(B * p - B));      
    }
    
  }
  
}


