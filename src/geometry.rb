module Geometry
  include Math
  extend Math

  # Earth radius near Equator Line
  EARTH_RADIUS = 6378
  
  def euclidean_distance(point1, point2)
    hypot point1[:x] - point2[:x], point1[:y] - point2[:y]
  end

  def calculate_spherical_distance(point1, point2)
    x1 = deg_2_rad(point1[:x])
    x2 = deg_2_rad(point2[:x])
    y1 = deg_2_rad(point1[:y])
    y2 = deg_2_rad(point2[:y])


    dlon = x2 - x1
    dlat = y2 - y1
    a = (sin(dlat/2))**2 + cos(y1) * cos(y2) * (sin(dlon/2))**2 
    c = 2 * atan2( sqrt(a), sqrt(1-a) ) 
    d  = 6378 * c
  end

  def deg_2_rad(deg)
      rad = deg * Math::PI/180; 
      rad
  end

  module_function :euclidean_distance
  module_function :deg_2_rad
  module_function :calculate_spherical_distance
end