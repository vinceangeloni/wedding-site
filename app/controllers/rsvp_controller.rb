class RsvpController < ApplicationController
	layout "interface"
  # Our main RSVP interface
  def index
    @meals = Meal.all
  	unless params['rsvp_code'].blank?
  		@invitee = Invite.find_by(rsvp_code: params['rsvp_code'].downcase)
  		if (!@invitee)
  			@not_found = true
  		end 
  	end
  end
  def respond
    unless params['rsvp_code'].blank?
      @guest = Guest.new
      @meals = Meal.all
      @step = params['step']
      @attending = params['attending']
      @guestCount = params['guest_count']
      @guestCountInt = @guestCount.to_i
      @rsvp_code = params['rsvp_code'].downcase
      @invitee = Invite.find_by(rsvp_code: params['rsvp_code'].downcase)


      if @step == "2"
        @actionName = "respond"
      elsif @step == "3"
        @actionName = "send_rsvp"
      end

      if (!@invitee)
        redirect_to action: 'index', not_found: true, rsvp_code: @rsvp_code 
      elsif (@invitee.response == true)
        redirect_to action: 'index', responded: true, rsvp_code: @rsvp_code
      end
    else
      redirect_to action: 'index'
    end
  end

  def send_rsvp
  	@invitee = Invite.find_by(rsvp_code: params['rsvp_code'].downcase)
    @invitee.update_attribute(:attending, params['attending'])
    rsvp_code = params['rsvp_code'].downcase

    # Check if they are even attending
    if (@invitee.attending == true)
      # Set up our guests
    	
      guests = params[:guests]
      
      guests.each do |guest|
        new_guest = Guest.create(:first_name => guest[1]['first_name'], :last_name => guest[1]['last_name'], :menu_item => guest[1]['meal'], :dietary => guest[1]['dietary'], :dietary_text => guest[1]['dietary_text'], :rsvp_code => rsvp_code)
        if new_guest.save
          puts "Guest saved..."
        end
      end
    end

    # Send an email to us with the deets
    if (!@invitee.response)

    end

    # Lastly, update their RSVP response to true
    #@invitee.update_attribute(:response, true)

    # Let's redirect to the registry URL. You know, to make some last purchases.
    #redirect_to registry_path(:rsvp =>1)


  end
end
