class GroupsController < ApplicationController
	before_action :signed_in_user

	def create

		@group = Group.new
		@group.name = params[:group][:name]
		@group.save

		add_group_subscription
		add_group_master
	end

	def destroy
		Group.find(params[:id]).destroy
		flash[:success] = "Your group is deleted"
		redirect_to root_url
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		@group.update(name: params[:group][:name])
		redirect_to root_url
	end

	def index
		user = User.first
		group_ids = GroupSubscription.where(user_id: current_user.id).select(:group_id)
		@groups=Group.where(id: group_ids)
	end

	def new
		#@group = Group.new
		@users = User.all
  end

	def messages
		#render plain: 'hello'
		@group = Group.find(params[:id])
		render json: @group.messages
	end

	def show
=begin
		if current_user.blank?
			return render plain: 'Bad person', status: :bad_request
		end
=end
		@group = Group.find(params[:id])
		if !@group.group_subscriptions.where(user_id: current_user.id).exists?
			return render plain: 'Bad person', status: :bad_request
		end
		@group.group_subscriptions.each do |g|
			@gmaster = @group.group_masters
			@gsub = @group.group_subscriptions
			@message = Message.new
		end
	end

	private
	def signed_in_user
		redirect_to root_url unless signed_in?
	end

	def add_group_subscription
		group_subscription = GroupSubscription.new
		group_subscription.group_id = @group.id
		group_subscription.user_id = current_user.id
		group_subscription.save

		for id in params[:group_users] || [] do
			group_subscription = GroupSubscription.new
			group_subscription.group_id = @group.id
			group_subscription.user_id = id.to_i
			group_subscription.save
		end
	end

	def add_group_master
		group_master = GroupMaster.new
		group_master.group_id = @group.id
		group_master.user_id = current_user.id
		group_master.save
	end
end
