# SimpleGraphics
require 'simple_graphics/shapes'

# OpenGL
require 'rubygems'
require 'opengl'
include Gl,Glu,Glut

module SimpleGraphics

  class App

      OPTIONS = {
          :width => 500, 
          :height => 500, 
          :position_x => 100, 
          :position_y => 100, 
          :title => "SimpleGraphics App"
      }   
      
      def initialize(options = {}) 

        @options = OPTIONS.merge(options)

        glutInit
        glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
        glutInitWindowSize(@options[:width], @options[:height]) 
        glutInitWindowPosition(@options[:position_x], @options[:position_y])
        glutCreateWindow(@options[:title])
      	glClearColor(0.0, 0.0, 0.0, 0.0)	
      	glMatrixMode(GL_PROJECTION)
      	glLoadIdentity()
      	glOrtho(-2.4, 2.4, -1.8, 1.8, -1, 1)        
      	
      end
      
      def keyboard(&block)

        if block_given?
          @keyboard_func = block
        end

        @keyboard_func ||= Proc.new do |key, x, y|
        	case (key)
        		when ?\e
        		exit(0);
        	end
        end

      end

      def display(&block)

        if block_given?
          @display_func = block
        end

        @display_func ||= Proc.new do; end

      end      
      
      def start
        glutDisplayFunc(display) 
        glutKeyboardFunc(keyboard)
        glutMainLoop()
      end
    
  end
  
end