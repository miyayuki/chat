class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
	end

	def master
		p params[id]
	end

	def show
		@user = User.find(params[:id])
	end

private
	def user_params
		params.require(:user).permit(:name, :email)
	end

end
