class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

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
		p "メッセージ作成"
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

    def message_params
			p "ぱらむす"
			p params
			params[:user_id] = current_user.id
      #params.require(:message).permit(:group_id, :user_id, :content, :created_id)
    end
end
