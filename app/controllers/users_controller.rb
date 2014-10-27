class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
	end

	def show
		p params[:id]
		@user = User.find(params[:id])
	end

private
	def user_params
		params.require(:user).permit(:name, :email)
	end

end
