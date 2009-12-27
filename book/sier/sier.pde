/**
 * sier, Sierpinski Sieve
 */

int     p = 5;
int[]   t = new int[p];
float   a = sqrt(3); 

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
 return map(value, -2.6, 2.6, 0, width); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
 return map(value, -2.4, 1.5, 0, height); 
} 
 
 
/**
 * Draw fractal 
 */
void draw() {
 
 for (int m = 0; m <= p; m++) {

   for (int n = 0; n <= pow(3, m) - 1; n++) {
    
    int n1 = n;
    
    for (int l = 0; l <= m - 1; l++) {
      t[l] = n1 % 3;
      n1 = n1 / 3;
    }
    
    float x = 0;
    float y = 0;
    
    for (int k = 0; k <= m - 1; k++) {
      x = x + cos((4 * t[k] + 1) * PI / 6) / pow(2, k);
      y = y + sin((4 * t[k] + 1) * PI / 6) / pow(2, k);      
    }
    
    float u1 = x + a / pow(2, m + 1);
    float u2 = x - a / pow(2, m + 1);
    float v1 = y - 1 / pow(2, m + 1);
    float v2 = y + 1 / pow(2, m);
    
    line(mapX(u1), mapY(v1), mapX(x),  mapY(v2));
    line(mapX(x),  mapY(v2), mapX(u2), mapY(v1));    
    line(mapX(u2), mapY(v1), mapX(u1), mapY(v1));    
    
  } 
  
 }
  
}


