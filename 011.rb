  # Devise example
  
  class SupportTicketsFeature < Bbq::TestCase
    scenario "user can open support ticket" do
      user = TestUser.new(self, 
        :login    => "euruko", 
        :password => "potrzebie",
        :scope    => :user # your devise user class
      )
   
      user.register # bonus method using your Devise routes
      user.login    # bonus method using your Devise routes
  
      user.open_ticket("Euruko Berlin", "Euruko is awesome!")
      user.see! "Euruko is awesome!"
  
      user.logout   # bonus method using your Devise routes
    end
  end
