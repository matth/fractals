# Pascal's Triangle in RubyOpenGL
#
# Matt Haynes, December 2009
#

# Include the SimpleGraphics package, just handles a load of the OpenGL setup
$:.push("lib")
require 'simple_graphics'
include SimpleGraphics

# Start a new SimpleGraphics App
app = App.new(:title => "Sierpinski triangle IFS")

app.display do
  
  glClear(GL_COLOR_BUFFER_BIT)
    
  x = 1
  y = 1
  
  (0..500000).each do
    
    Shapes.square(x, y, 0.001)    
      
    case(1 + rand(3))
      when 1
        glColor(0, 0.23, 1) # blue
        x = x * 0.5
        y = y * 0.5
      when 2
        glColor(0.8, 1, 0.25) # yellow       
        x = (x * 0.5) + 0.25
        y = (y * 0.5) + (0.5 * (Math.sqrt(3) / 2))
      when 3
        glColor(1, 0.2, 0.4) # red                
        x = (x * 0.5) + 0.5
          y = y * 0.5        
    end

  end

  glutSwapBuffers()  
	
end

app.start