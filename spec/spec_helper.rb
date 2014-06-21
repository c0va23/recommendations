ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'
require File.expand_path("../../config/environment", __FILE__)

DatabaseCleaner.strategy = :transaction
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  # config.filter_run :focus

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.order = 'random'
end
