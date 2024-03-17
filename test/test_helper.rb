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

    def is_logged_in?
      session[:id].nil?
    end
    def is_admin?
      return $currentUser.admin
    end
    def is_guest?
      puts "User type:  #{$currentUser.usertype}"
      return $currentUser.usertype == 'guest'
    end
    def is_student?
      puts "User type:  #{$currentUser.usertype}"
      return $currentUser.usertype == 'student'
    end


    def login_in_as(user, options = {})
      password       = options[:password]     || 'password'
      remember_me    = options[:remember_me]  || '1'
      # post login_path(email: user.email, password: user.password)
      if integration_test?
         post login_path(params: { session: {email:user.email, password:user.password} })
      else
         session[:user_id] = user.id
         $currentUser = user
      end
    end

    private
       def integration_test?
         defined?(post_via_redirect)
       end



    def testHelper
      puts ">>>>>>>>  TEST HELPER"
    end


  end
end
