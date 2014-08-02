require 'rspec'
require 'mocha'
require 'simplecov'

SimpleCov.start do
  add_filter 'run.rb'
end

RSpec.configure do |c|
  c.order = :rand
  c.mock_with :mocha
end

require 'xox'
