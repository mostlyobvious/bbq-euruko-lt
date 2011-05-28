  # Capybara methods example
  
  class TestUser < Bbq::TestUser
    def open_ticket(summary, description)
      @session.visit "/support/tickets"
      @session.click_on "Open a new ticket"
      @session.fill_in "Summary", :with => summary
      @session.fill_in "Description", :with => description
      @session.click_on "Open ticket"
    end
  end
  
  class SupportTicketsFeature < Bbq::TestCase
    scenario "user can open support ticket" do
      user = TestUser.new(self, 
        :login    => "euruko", 
        :password => "potrzebie"
      )
      
      user.open_ticket("Euruko Berlin", "Euruko is awesome!")
      # see with built-in assert
      user.see! "Euruko is awesome!"
    end
  end
