require 'spec_helper'

describe Geometry do
	it "should calculate the distance using the Earth radius Nelson Piquet" do 
		point1 = {:x => -47.900648, :y => -15.772954} 
		point2 = {:x => -47.900365, :y => -15.772869}
		point3 = {:x => -47.90025, :y => -15.772835}
		Geometry.calculate_spherical_distance(point1, point2).should be_true
		Geometry.calculate_spherical_distance(point1, point3).should be_true
	end	

	it "should find the exact distance between 2 points on the earth" do
		point1 = {:x => -47.900331, :y => -15.77284} 
		point2 = {:x => -47.897064, :y => -15.77171}
		distance = Geometry.calculate_spherical_distance(point1, point2)
		distance.should be_within(0.001).of(0.372) # in Km
	end
end