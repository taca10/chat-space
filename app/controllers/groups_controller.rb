class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = "グループは作成されませんでした"
      render :new
    end
  end

  def edit

  end

  def group_params
    params.require(:group).permit(:name, {user_ids: []} )
  end

end
