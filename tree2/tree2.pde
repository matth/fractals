/**
 * tree2, Structure of a Binary Tree
 */
 
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
 return map(value, -2, 2, 0, width); 
}

/**
 * Map y coordinates to the screen height
 */
float mapY(float value) {
 return map(value, -0.5, 2.5, 0, height); 
}

/**
 * Draw fractal
 */
void draw() {
 
 for (int k = 1; k <= 7; k++) {
   
   float h = pow(2, -k + 1);
   
   line(mapX(0), mapY(0), mapX(0), mapY(1));
   
   for (int l = 1; l <= int(pow(2, k)); l++) {
     
     float x = -2 + (4 * l -2) * h;
     float y = 2 - h;
     
     line(mapX(x - h), mapY(y + h / 2), mapX(x - h), mapY(y));
     line(mapX(x - h), mapY(y), mapX(x + h), mapY(y));
     line(mapX(x + h), mapY(y), mapX(x + h), mapY(y + h / 2));     
     
   }

 }
  
}
