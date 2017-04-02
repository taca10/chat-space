class MessagesController < ApplicationController
  def index
    @groups = current_user.groups.order('created_at DESC')
    @group = Group.find(params[:group_id])
    @users = @group.users
  end
end
