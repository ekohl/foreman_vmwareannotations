# This calls the main test_helper in Foreman-core
require 'test_helper'
require 'database_cleaner'

# Foreman's setup doesn't handle cleaning up for Minitest::Spec
DatabaseCleaner.strategy = :transaction

module Minitest
  class Spec
    before :each do
      DatabaseCleaner.start
    end

    after :each do
      DatabaseCleaner.clean
    end
  end
end
