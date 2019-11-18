class User < ApplicationRecord
	belongs_to :game, optional: true
	attr_writer :login
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	def login
		@login || self.username || self.email
	end
end
