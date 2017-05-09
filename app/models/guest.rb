class Guest < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :menu_item, presence: true, numericality: { only_integer: true }
	validates :rsvp_code, presence: true

	
end
