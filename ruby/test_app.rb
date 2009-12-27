$:.push("lib")

require 'simple_graphics'
include SimpleGraphics

app = App.new(:title => "Matt's App")

app.display do 

	glClear(GL_COLOR_BUFFER_BIT)

	glColor(0.5, 0.5, 1.0)

  point_size = 0.001

  (1..1000).each do |i|
    (1..i).each do |j|

      center   = 0.5 - point_size
      x_offset = (point_size / 2) * i  # half point size * number of points
      x        = center + (j * point_size) - x_offset
      y        = 1.0 - (i * point_size)


      if (((j - 1) & (i - j)) == 0)
        Shapes.square(x, y, point_size)      
      end

    end
  end

	glutSwapBuffers()

end

app.start