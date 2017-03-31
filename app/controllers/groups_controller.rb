class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    group = Group.create(group_params)
    if group.save
      flash[:notice] = "グループが作成されました"
      redirect_to action: :index
    else
      flash[:alert] = "グループは作成されませんでした"
      redirect_to action: :new
    end
  end

  def edit

  end

  def group_params
    params.require(:group).permit(:name, {user_ids: []} )
  end

end
