require 'rspec'
Dir[File.expand_path(File.join(File.dirname(__FILE__),'../src','**','*.rb'))].each {|f| require f}

RSpec.configure do |c|
  c.mock_with :rspec
end