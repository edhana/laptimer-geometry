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
end