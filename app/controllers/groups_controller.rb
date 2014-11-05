class GroupsController < ApplicationController
	before_action :signed_in_user

	def create

		@group = Group.new
		@group.name = params[:group][:name]
		@group.save

		@group_subscription = GroupSubscription.new
		@group_subscription.groupID = @group.id
		@group_subscription.userID = current_user.id
		@group_subscription.save

		p params[:group_users]
		for id in params[:group_users] || [] do
			p id
			@group_subscription = GroupSubscription.new
			@group_subscription.groupID = @group.id
			@group_subscription.userID = id.to_i
			@group_subscription.save
		end

		@group_master = GroupMaster.new
		@group_master.groupID = @group.id
		@group_master.userID = current_user.id
		@group_master.save
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
		group_ids = GroupSubscription.where(userID: current_user.id).select(:groupID)
		@groups=Group.where(id: group_ids)
		@groups.each do |g|
			p g
		end
=begin
		@groups = Group.all
		@groups.each do|g|
			g.group_subscriptions.each do|s|
				p g.class
				@group = Group.new(g)
			end
		end
		p 'グループ'
		p @group
			if s.user.id == current_user.id
				p '自分が所属してるグループです'
				p s
				@group = s
			else
				#return render plain: 'Bad person', status: :bad_request
			end
			end
=end
	end

	def new
		#@group = Group.new
		@users = User.all
  end

	def message
	end

	def show
=begin
		if current_user.blank?
			return render plain: 'Bad person', status: :bad_request
		end
=end
		@group = Group.find(params[:id])
		if !@group.group_subscriptions.where(userID: current_user.id).exists?
			return render plain: 'Bad person', status: :bad_request
		end
		@group.group_subscriptions.each do |g|
			if g.user.id == current_user.id
				@gmaster = @group.group_masters
				@gsub = @group.group_subscriptions
				@message = Message.new
			else
				p 'このグループのメンバーではありません'
			end
		end
	end

	private
	def signed_in_user
		redirect_to root_url unless signed_in?
	end
end
