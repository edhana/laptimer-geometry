class Line
	def initialize(pointA, pointB)
		@a, @b, @c = nil, nil, nil
		@gradient = nil
		@linear = nil
		@pointA = pointA
		@pointB = pointB
		calculate_gradient
		calculate_linear
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
		x = calculate_x_from_two_lines(self, line)
		y = (@gradient*x.to_f) + @linear

		new_point = { :x => x, :y => y}

		if include?(new_point)
			true
		else
			false
		end
	end

	def linear_touch
		@linear
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