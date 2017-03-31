class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to  controller: :groups, action: :index
  end

  def edit

  end

  def group_params
    params.require(:group).permit(:name, {user_ids: []} )
  end

end
