  # test/acceptance/test_user.rb
  
  # How does TestUser look like
  require 'test_helper'
  
  class TestUser < Bbq::TestUser
    # has capybara methods
    # they run in exclusive session
    #
    # see!/not_see! (with asserts inside)
    # see?/not_see? (predicates)
    # 
    # roles for test personas
    #
    # devise methods: login, logout, regsiter
  end


