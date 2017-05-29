class RsvpMailer < ApplicationMailer
	default from: "rsvp-bot@laurenandvince.ca"

	def rsvp_email(rsvp_code)
    	@invitee = Invite.find_by(rsvp_code: rsvp_code)

    	if (@invitee.attending)
    		@guests_count = Guest.where(:rsvp_code => rsvp_code).count
 		end
    	mail(to: "vince_a@me.com,laurenfinnie@hotmail.com", subject: 'New RSVP')
  	end
  	def guest_rsvp_confirm(rsvp_code)
  		@invitee = Invite.find_by(rsvp_code: rsvp_code)
  		if (@invitee.attending)
    		@guests = Guest.where(:rsvp_code => rsvp_code)
 		end

    	mail(to: @invitee.email, subject: 'Vince and Lauren\'s Wedding RSVP!')
  	end
end
