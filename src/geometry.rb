class Line
	def initialize(pointA, pointB)
		@a, @b, @c = nil, nil, nil
		@gradient = nil
		@pointA = pointA
		@pointB = pointB
		calculate_gradient
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
	end

	private
	def calculate_gradient
		@gradient = (@pointB[:y] - @pointA[:y]) / (@pointB[:x] - @pointA[:x]).to_f
	end
end