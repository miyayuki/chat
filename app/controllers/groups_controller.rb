class GroupsController < ApplicationController

	def create
    p params

    @group = Group.new
    @group.name = params[:group][:name]
    @group.save
    p @group

    for id in params[:group_users] do
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

	def index
		@groups = Group.all
	end

	def new
		#@group = Group.new
		@users = User.all
  end

	private
end
