require 'spec_helper'
require File.expand_path('../../src/geometry', __FILE__)

describe Line do
	before do
		# first semi-line
		@pointA = {:x => 2, :y => 1}
		@pointB = {:x => 4, :y => 3}
		#second semi-line
		@pointC = {:x => 2, :y => 4}
		@pointD = {:x => 3, :y => 1}
	end

	it "should find the gradient of the straight line" do
		sl = Line.new(@pointA, @pointB)
		sl.gradient.should be_eql(1.to_f)
	end

	# it "should create a straight with the points" do
	# 	sl1 = Line.create_new(@pointA, @pointB)
	# 	sl1.gradient.should be_eql(2/3.to_f)
	# end

	it "should complete the coefficients of the line" do
		# sl1 = Line.new(@pointA, @pointB)
		# sl1.gradient.should be_eql(2/3.to_f)
	end
end