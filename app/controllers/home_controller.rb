class HomeController < ApplicationController
  def index
		p "ログインセッション情報 "
		p current_user
		p session[:session_id]
  end

	def home
		@group = Group.find(params[:id])
		@message = @group.messages.build
	end
end
