  # Roles examle
  
  class TestUser < Bbq::TestUser
    module TicketReporter
      def update_ticket(summary, comment)
        show_ticket(summary)
        # do stuff
      end
  
      def show_ticket(summary)
        @session.visit "/support/tickets"
        @session.click_on summary
      end
    end
    
    module TicketManager
      def update_ticket(summary, comment)
        show_ticket(summary)
        # do other stuff
      end
    
      def show_ticket(summary)
        @session.visit "/support/admin/tickets"
        @session.click_on summary
      end
    end
  end
  
  class SupportTicketsFeature < Bbq::TestCase
    scenario "user provides more details on ticket" do
      alice = TestUser.new(self, :login => "alice", :password => "potrzebie")
      alice.roles(:ticket_reporter)
  
      bob   = TestUser.new(self, :login => "alice", :password => "potrzebie")
      bob.roles(:ticket_manager)
  
      [alice, bob].each(&:register_and_login)
  
      alice.open_ticket("Euruko Berlin", "Euruko is awesome!")
      bob.update_ticket("Euruko Berlin", "Thanks! Any details?")
      alice.update_ticket("Euruko Berlin", "Great people!")
  
      [alice, bob].each do |actor| 
        actor.see!("Euruko is awesome", "Thanks! Any details?", "Great people!") 
      end
    end
  end
