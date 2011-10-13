require 'spec_helper'
require File.expand_path('../../src/geometry', __FILE__)

describe Geometry do
	it "should calculate the right euclidean distance between 2 points" do
		pointA = { :x => 0, :y => 4 }
		pointB = { :x => 4, :y => 4 }

		Geometry.euclidean_distance(pointA, pointB).should be_eql(4.0)
	end

	it "should calculate the right earth(spheric) distance between 2 points" do
		
	end
end