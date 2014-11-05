class UsersController < ApplicationController
	before_action :signed_in_user
	
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
	def signed_in_user
		redirect_to root_url unless signed_in?
	end

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
