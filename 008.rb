  # Example test case
  # test/acceptance/support/my_feature_test.rb
  
  class MyCaseFeature < Bbq::TestCase
    background do
      # this adds callback to setup
    end
    background :some_helper # this also
  
    scenario "this is my case" do
      user = TestUser.new(self, 
        :login          => "tester", 
        :password       => "dupa.8", 
        :another_option => "look_at_me"
        # acces them from @options in instance
      )
      
      # test user method
      user.some_method
  
      # bare capybara method here
      user.visit("/")
  
      # capybara has_content? 
      # with built-in assert
      user.see!("hello", "world", "!")
    end
  end
