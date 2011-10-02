require 'spec_helper'
require File.expand_path('../../src/geometry', __FILE__)

describe Line do
	before do
		# first semi-line
		@pointA = {:x => 2, :y => 1}
		@pointB = {:x => 4, :y => 3}
		#second semi-line
		@pointC = {:x => 3, :y => 1}
		@pointD = {:x => 2, :y => 4}
		#third semi-line
		@pointE = {:x => 3, :y => 0}
		@pointF = {:x => 1, :y => 2}
	end

	it "should find the gradient of the straight line" do
		sl = Line.new(@pointA, @pointB)
		sl.gradient.should be_eql(1.to_f)
	end

	it "should find the linear touch of the line" do
		sl = Line.new(@pointA, @pointB)
		sl.linear_touch.should be_eql(-1.to_f)

		# Double Test
		sl2 = Line.new(@pointE, @pointF)
		sl2.linear_touch.should be_eql(3.to_f)
	end

	it "should include anotther point from the line" do
		pointC = {:x => 3, :y => 2}
		sl = Line.new(@pointA, @pointB)
		sl.include?(pointC).should be_true
	end

	it "should intercept with the other line (3,0) and (1,2)" do
		sl = Line.new(@pointA, @pointB)
		sl2 = Line.new(@pointC, @pointD)
		sl.intercept?(sl2).should be_true
		sl3 = Line.new(@pointE, @pointF)
		sl.intercept?(sl3).should be_true
	end

	it "two concurrent lines should intercept at (2,2)" do
		pA = {:x => 1, :y => 1}
		pB = {:x => 3, :y => 3}
		pC = {:x => 1, :y => 3}
		pD = {:x => 3, :y => 1}
		sl = Line.new(pA, pB)
		sl2 = Line.new(pC, pD)
		sl.intercept?(sl2).should be_true
		sl.intercept_at(sl2).should be_eql({:x => 2.0, :y => 2.0})
	end

	it "should not intercept with a parallel line" do 
		pA = {:x => 1, :y => 1}
		pB = {:x => 3, :y => 3}
		pC = {:x => 2, :y => 1}
		pD = {:x => 3, :y => 2}
		sl = Line.new(pA, pB)
		sl2 = Line.new(pC, pD)
		sl.intercept?(sl2).should be_false
	end

	it "should intercept between the 2 original points of the first line" do
		pA = {:x => 1, :y => 1}
		pB = {:x => 3, :y => 3}
		pC = {:x => 1, :y => 3}
		pD = {:x => 3, :y => 1}
		sl = Line.new(pA, pB)
		sl2 = Line.new(pC, pD)
		sl.intercept_line_segment?(sl2).should be_true
	end

	it "should not find an interception between the two segments" do
		pA = {:x => 1, :y => 1}
		pB = {:x => 3, :y => 3}
		pC = {:x => 4, :y => 3}
		pD = {:x => 6, :y => 1}
		sl = Line.new(pA, pB)
		sl2 = Line.new(pC, pD)
		sl.intercept_line_segment?(sl2).should be_false
	end

	it "should intercept event in the negative Y quadrant" do 
		flag_line = Line.new({:x => 1, :y => -1, }, {:x => 3, :y => -4})
		segment1 = Line.new({:x => 1, :y => -3}, {:x => 3, :y => -1})

		flag_line.intercept_line_segment?(segment1).should be_true
	end


	it "should intercept event in the negative X quadrant" do 
		flag_line = Line.new({:x => -1, :y => 1, }, {:x => -3, :y => 4})
		segment1 = Line.new({:x => -3, :y => 1}, {:x => -1, :y => 3})

		flag_line.intercept_line_segment?(segment1).should be_true
	end

	it "should intercept event in the all negative quadrant" do 
		flag_line = Line.new({:x => -1, :y => -1, }, {:x => -3, :y => -3})
		segment1 = Line.new({:x => -1, :y => -3}, {:x => -2, :y => -2})

		flag_line.intercept_line_segment?(segment1).should be_true
	end

	it "should intercept when segments are in different quadrants" do 
		flag_line = Line.new({:x => -1, :y => 1, }, {:x => -3, :y => 4})
		segment1 = Line.new({:x => 1, :y => 3}, {:x => 3, :y => 1})

		flag_line.intercept_line_segment?(segment1).should be_false
	end

	it "should calculate the distance using the Earth radius" do 
		point1 = {:x => -47.900648, :y => -15.772954} 
		point2 = {:x => -47.900365, :y => -15.772869}
		point3 = {:x => -47.90025, :y => -15.772835}
		Geometry.calculate_distance(point1, point2).should be_true
		Geometry.calculate_distance(point1, point3).should be_true
	end

	it "should find the crossing segment with some real coordinates" do 
		flag_line = Line.new({:x => -47.900333, :y => -15.772656, }, {:x => -47.900148, :y => -15.773056})
		segment1 = Line.new({:x => -47.900648, :y => -15.772954}, {:x =>-47.899923, :y => -15.772683})

		flag_line.intercept_line_segment?(segment1).should be_true
	end

	it "should not accept the crossing form real segments with they do not touch" do
		flag_line = Line.new({:x => -47.900333, :y => -15.772656, }, {:x => -47.900148, :y => -15.773056}) 
		segment1 = Line.new({:x => -47.900648, :y => -15.772954}, {:x =>-47.900365, :y => -15.772869})

		flag_line.intercept_line_segment?(segment1).should be_false
	end

end