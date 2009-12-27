module SimpleGraphics
  
  module Shapes
    
    def Shapes.square(x, y, size)
      
      glBegin(GL_POLYGON)

      # bl, br, tr, tl
    	glVertex(x, y)
    	glVertex(x + size, y)
    	glVertex(x + size, y + size)	
    	glVertex(x, y + size)
	
    	glEnd()
    end	
    
  end
  
end