class Game < ApplicationRecord
	has_many :users
	belongs_to :thing
end
