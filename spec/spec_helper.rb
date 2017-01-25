ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'active_support'

require 'rspec/rails'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:expect, :should]
  end

  config.include FactoryGirl::Syntax::Methods

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = File.expand_path('../fixtures', __FILE__)
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Output format
  config.color = true
  config.tty = true
  config.formatter = :progress

  ActiveSupport::Deprecation.silenced = true
end