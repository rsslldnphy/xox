require 'rspec'
require 'mocha'
require 'simplecov'

SimpleCov.start

RSpec.configure do |c|
  c.order = :rand
  c.mock_with :mocha
end

require 'xox'
