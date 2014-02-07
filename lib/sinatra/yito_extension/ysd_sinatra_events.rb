module Sinatra
  module YitoExtension
    #
    # Sinatra extension to show events
    #
  	module Events

      def self.registered(app)

        app.get "/events" do 

          load_page(:events, :locals => {:events_json_url => "/api/events"})	
        	
        end

      end

  	end
  end
end