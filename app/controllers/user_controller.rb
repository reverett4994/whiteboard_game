class UserController < ApplicationController

	def update_op_url
		game=current_user.game
		game.users.each do |u|
			u.op_url = params[:url]
			u.save
		end
	end

end