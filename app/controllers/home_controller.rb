class HomeController < ApplicationController
  def index
		p "ログインセッション情報 "
		p current_user
		p session[:session_id]
  end
end
