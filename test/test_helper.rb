ENV["RAILS_ENV"] ||= "test"
# require File.expand_path('../../config/environment', __FILE__)
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

module ActiveSupport
  class TestCase
    fixtures :all
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def testHelper
      puts ">>>>>>>>  TEST HELPER"
    end


    # Add more helper methods to be used by all tests here...
    def sign_in_as(user)
      # post login_path(email: user.email, password: user.password)
      post login_path(params: { session: {email:user.email, password:user.password} })
    end

    def is_logged_in?
      :session[:user_id].nil?
    end
  end
end
