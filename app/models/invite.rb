class Invite < ActiveRecord::Base
	validates :rsvp_code, presence: true, length: { is: 4 }
	validates :name, presence: true
	before_create :generate_code


	# Generates the rsvp code
	def generate_code
	      self.rsvp_code = SecureRandom.random_number(36**4).to_s(36).rjust(4, "0").to_s
  	end
end
