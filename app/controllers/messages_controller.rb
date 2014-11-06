class MessagesController < ApplicationController
#  before_action :set_message, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user, only:[:create, :destroy]

  def index
#    @messages = Message.all
#    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
=begin
		p "メッセージ作成"
		@group = Group.find(params[:group_id])
		p @group.name
		@group.group_subscriptions.each do |g|
			if g.user.id == current_user.id
				p current_user.username
			else
				p g.user.username
			end
		end
=end
		params[:user_id] = current_user.id
    @message = Message.new
		@message.group_id = params[:group_id]
		@message.user_id = params[:user_id]
		@message.content = params[:message][:content]
		p @message

		@message.save
		redirect_to group_path @message.group_id
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

		def signed_in_user
			redirect_to root_url unless signed_in?
		end

    def message_params
			p "ぱらむす"
			p params
			params[:user_id] = current_user.id
      #params.require(:message).permit(:group_id, :user_id, :content, :created_id)
    end
end
