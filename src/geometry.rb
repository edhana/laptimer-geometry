class StraightLine
	def initialize(a, b, c)
		@a, @b, @c = a, b, c
		@gradient = nil
		@point1 = nil
		@point2 = nil

		if not @a.nil? and not @b.nil? and not @c.nil?
			calculate_gradient
		end
	end	

	def point1(point)
		# hash => {:x => value, :y => value}
		unless point.nil?
			@point = point
		else
			return @point1
		end
	end

	def point2(point)
		return @point2
	end

	def gradient(ac = nil)
		if ac.nil?
			@gradient
		else
			@gradient = ac
		end

		@gradient
	end

	def straight_equation
		b_signal = ""
		if @b >= 0
			b_signal = "+"
		end

		c_signal = ""
		if @c >= 0
			c_signal = "+"
		end
		"#{@a}x#{b_signal}#{@b}y#{c_signal}#{@c}=0"
	end

	def self.create_new(pointA, pointB)
		sl = StraightLine.new(nil, nil, nil)
		sl.gradient((pointB[:y] - pointA[:y])/(pointB[:x] - pointA[:x]).to_f)
		sl
	end

	private
	def calculate_gradient
		@gradient = (-1*@a)/@b.to_f
	end
end