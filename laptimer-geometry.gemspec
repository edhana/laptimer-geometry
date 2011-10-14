require 'rake'

Gem::Specification.new do |s|
  s.name = "laptimer-geometry"
  s.version = "0.0.2"
  s.author = "Eduardo Marques"
  s.email = "edhana@gmail.com"
  s.homepage = "http://github.com/edhana/laptimer-geometry"
  s.platform = Gem::Platform::RUBY
  s.summary = "Implementation of basic 2D geometry algorithms, to help with a lap timer system written in Ruby"
  s.files = FileList["{src}/**/*"].to_a
  s.require_path = "src"
  s.test_files = FileList["{spec}/**/*spec.rb"].to_a
  s.has_rdoc = false
  s.description = <<-EOF
    laptimer-geometry is a gem created to help the coordinate calculations used in laptimer software.
    v0.0.2 
      - Added a new method to calculate distance between two geographic points
      - Improved the accuracy of the distance calculation
  EOF
end
