class UserController < ApplicationController

	def update_op_url
		game=current_user.game
		game.users.each do |u|
			u.op_url = params[:url]
			u.save
		end
	end

	def get_op_url
		@user = User.find(params[:u])
	    respond_to do |format|
	        format.json { render :json => ( @user.op_url) }
         end
	end

end