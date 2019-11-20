class Game < ApplicationRecord
	has_many :users
	has_one :thing
end
