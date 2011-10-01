require 'spec_helper'
require File.expand_path('../../src/geometry', __FILE__)

describe StraightLine do
	before do
		# first semi-line
		@pointA = {:x => 1, :y => 1}
		@pointB = {:x => 4, :y => 3}
		#second semi-line
		@pointC = {:x => 2, :y => 4}
		@pointD = {:x => 3, :y => 1}
	end

	it "should find the gradient of the straight line" do
		sl = StraightLine.new(3, -4, 2)
		sl.gradient.should be_eql(3/4.to_f)
	end

	it "should create a straight with the points" do
		sl1 = StraightLine.create_new(@pointA, @pointB)
		sl1.gradient.should be_eql(2/3.to_f)
	end

	it "should complete the coefficients of the line" do
		sl1 = StraightLine.create_new(@pointA, @pointB)
		sl1.gradient.should be_eql(2/3.to_f)
	end
end