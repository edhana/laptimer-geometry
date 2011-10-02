module Geometry
  include Math
  extend Math
  
  def distance(point1, point2)
  	x1 = (point1[:x] > 0) ? point1[:x] : (point1[:x]*-1 )
  	x2 = (point2[:x] > 0) ? point2[:x] : (point2[:x]*-1 )
  	y1 = (point1[:y] > 0) ? point1[:y] : (point1[:y]*-1 )
  	y2 = (point2[:y] > 0) ? point2[:y] : (point2[:y]*-1 )
    hypot x1 - x2, y1 - y2
  end

	def calculate_distance(point1, point2)
		x1 = point1[:x] * Math::PI / 180
		x2 = point2[:x] * Math::PI / 180
		y1 = point1[:y] * Math::PI / 180
		y2 = point2[:y] * Math::PI / 180

		s = sin(y2)*sin(y1)+(cos(y2)*cos(y1)*cos(x2 - x1))
		rad_distance = acos(s)
		degree_distance = rad_distance/(Math::PI/180)
		earth_radius = 6378
		distance_km = earth_radius*degree_distance		
		distance_km
	end

  module_function :distance
  module_function :calculate_distance
end

class Line
	include Math
	def initialize(pointA, pointB)
		@a, @b, @c = nil, nil, nil
		@gradient = nil
		@linear = nil
		@pointA = pointA
		@pointB = pointB
		calculate_gradient
		calculate_linear
	end	

	def pointA
		@pointA
	end

	def pointB
		@pointB
	end

	def gradient(ac = nil)
		if ac.nil?
			@gradient
		else
			@gradient = ac
		end

		@gradient
	end

	# m(x2-x1) - y2 + y1 = 0
	def include?(point) 
		result = @gradient * (point[:x] - @pointA[:x]) - point[:y] + @pointA[:y]
		if(result == 0)
			true
		else
			false
		end
	end

	def intercept?(line)	
		(intercept_at(line).nil? == true) ? false : true
	end

	def intercept_at(line)
		if @gradient != line.gradient								
			x = calculate_x_from_two_lines(self, line)
			y = (@gradient*x.to_f) + @linear
			
			new_point = { :x => sprintf('%.6f',x).to_f, :y => sprintf('%.6f',y).to_f}
			return new_point
		end

		return nil
	end

	def linear_touch
		@linear
	end

	def intercept_line_segment?(line)
		
		# verify the distance
		if intercept?(line)
			interception_point = intercept_at(line)

			distance_segment = Geometry.calculate_distance(line.pointA, line.pointB)
			distance_A_line_segment = Geometry.calculate_distance(line.pointA, interception_point)
			distance_B_line_segment = Geometry.calculate_distance(line.pointB, interception_point)

			if distance_A_line_segment > distance_segment 
				return false
			elsif distance_B_line_segment > distance_segment
				return false
			else
				return true
			end
		end

		return false
	end

	private
	def calculate_gradient
		@gradient = (@pointB[:y] - @pointA[:y]) / (@pointB[:x] - @pointA[:x]).to_f
	end

	def calculate_linear
		@linear = nil
		if not @gradient.nil?
			@linear =  @pointA[:y].to_f - (@gradient * @pointA[:x].to_f )
		end
		@linear
	end

	def calculate_x_from_two_lines(line1, line2)
		(line2.linear_touch - line1.linear_touch) / (line1.gradient - line2.gradient)
	end
end