class RsvpController < ApplicationController
	layout "interface"
  # Our main RSVP interface
  def index
  	unless params['rsvp_code'].blank?
  		@invitee = Invite.find_by(rsvp_code: params['rsvp_code'].downcase)
  		if (!@invitee)
  			@not_found = true
  		end 
  	end
  end

  def send_rsvp
  	@invitee = Invite.find_by(rsvp_code: params['rsvp_code'].downcase)
    @invitee.update_attribute(:attending, params['attending'])

    # Check if they are even attending
    if (@invitee.attending && !@invitee.response)

      # Set up our guests
      guests = params['guest']
    	
      guests.each.with_index(1) do |g, i|
    		first_name = g[i]['first_name']
    		last_name = g[i]['last_name']
    		menu_item = g[i]['menu_item']
    		dietary = g[i]['dietary']
    		dietary_text = g[i]['dietary_text']

    		new_guest = Guest.create(:first_name => first_name, :last_name => last_name, :menu_item => menu_item, :dietary => dietary, :dietary_text => dietary_text)
    	end
    end

    # Send an email to us with the deets
    if (!@invitee.response)

    end

    # Lastly, update their RSVP response to true
    @invitee.update_attribute(:response, true)

    # Let's redirect to the registry URL. You know, to make some last purchases.
    redirect_to registry_path(:rsvp =>1)



  end
end
