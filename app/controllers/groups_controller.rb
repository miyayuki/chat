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

=begin
    @group = Group.new(group_params)
		if @group.save
			#redirect_to groups_url
		else
			render 'new'
		end
=end
	end

	def index
		@groups = Group.all
	end

	def new
		#@group = Group.new
		@users = User.all
  end

	private
	def group_params
		params.require(:group).permit(:name)
	end
end
