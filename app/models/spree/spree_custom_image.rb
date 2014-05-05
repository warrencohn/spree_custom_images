module Spree
	class CustomImage < ActiveRecord::Base
		validates :name, presence: true
	end
end
