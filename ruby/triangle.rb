# Pascal's Triangle in RubyOpenGL
#
# Matt Haynes, December 2009
#
# This little app draws Pascal's Triangle with optional formulas for colouring 

# Include the SimpleGraphics package, just handles a load of the OpenGL setup
$:.push("lib")
require 'simple_graphics'
include SimpleGraphics

# Formulas for colouring
# These are the available formulas for colouring the triangle
formulas = [
  
  # Binary selection mod 2
  Proc.new do |i, j|
    if (j == 1 || ((~i) & j) == 0) # Lucas correspondence theorem 
	    glColor(0.5, 0.5, 1.0)
	  else 	
	    glColor(0, 0, 0)
    end      
  end,
  
  # Binomial coefficients mod 2
  Proc.new do |i, j|
    
      if ($memoize == nil)
        $memoize = []
      end
      
      def factorial(n) 
        
        if ($memoize[n] != nil)
          return $memoize[n]
        end
        
        if (n > 0)
					num = n * factorial(n - 1)
					$memoize[n] = num
					num
        else  
					1
        end
        
      end
      
      # We didn't start at zero
      i = i - 1
      j = j - 1
      
      binomial = factorial(i) / (factorial(j) * factorial(i - j))
      
      if (binomial % 2 == 0)
        glColor(0, 0, 0)        
      else
        glColor(0.5, 0.5, 1.0)
      end
  end
  
]

formula = 0

# Start a new SimpleGraphics App
app = App.new(:title => "Sierpinski triangle")

# On display make an 800 line Passcal's Triangle, we pass the line and column
# numbers through to the selected colouring formula to set the rendering colour
app.display do 

	glClear(GL_COLOR_BUFFER_BIT)

  point_size = 0.0015

  start = Time.now

  (1..512).each do |i|
    (1..i).each do |j|

      center   = 0.5 - point_size
      x_offset = (point_size / 2) * i  # half point size * number of points
      x        = center + (j * point_size) - x_offset
      y        = 0.99 - (i * point_size)

     formulas[formula].call(i, j) 
     
     Shapes.square(x, y, point_size)
     
   end
  end

  puts "Computed in #{(Time.now - start)} seconds"

	glutSwapBuffers()

end

app.start