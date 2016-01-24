require_relative '../game'
require_relative '../board'
require_relative '../player'
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end
end
