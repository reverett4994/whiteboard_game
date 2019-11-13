class UserController < ApplicationController

	def update_op_url
		current_user.op_url = params[:url]
		current_user.save
	end

end