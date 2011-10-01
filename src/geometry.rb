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

	private
	def calculate_gradient
		@gradient = (@pointB[:y] - @pointA[:y]) / (@pointB[:x] - @pointA[:x]).to_f
	end
end