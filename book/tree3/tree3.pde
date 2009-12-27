/**
 * tree3, Structure of a Ternary Tree
 */

int     p = 5;
float[] t = new float[p + 1];  // Order
float   a = 0.45;               // Reduction

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
 return map(value, -1.2, 1.2, 0, width); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
 return map(value, -0.9, 0.9, 0, height); 
} 
 
/**
 * Draw fractal 
 */
void draw() {
  
  for (int m = 0; m <= p; m++) {
   
    for (float n = 0; n <= pow(3, m) - 1; n++) {
      
      // Ternary notation of n        
      float n1 = n;
      
      for (int l = 1; l <= m; l++) {
        t[l] = n1 % 3;
        n1 = int(n1 / 3);
      }
      
      float x = 0.0;
      float y = 0.0;
      
      int k = 1;
    
      for (;k <= m; k++) {
        float f = (2 * t[k] * PI) / 3;
        x = x + cos(f) * pow(a, k);
        y = y + sin(f) * pow(a, k);
      }      

      line(mapX(x), mapY(y), mapX(x + pow(a, k)), mapY(y));        
      line(mapX(x), mapY(y), mapX(x - 0.5 * pow(a, k)), mapY(y + sqrt(3) / 2 * pow(a, k)));
      line(mapX(x), mapY(y), mapX(x - 0.5 * pow(a, k)), mapY(y - sqrt(3) / 2 * pow(a, k)));              
           
    }
    
  }  
  
}

