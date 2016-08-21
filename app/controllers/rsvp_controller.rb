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
  	@invitee.update_attribute(:response, true)

  	# Add guests to the DB
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
end
