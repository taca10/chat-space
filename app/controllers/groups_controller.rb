class GroupsController < ApplicationController

  before_action :get_group, only: [:edit,:update]

  def index
    @groups = current_user.groups.order('created_at DESC')
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループ作成に成功しました'
    else
      flash.now[:alert] = 'グループは作成されませんでした'
      render :new
    end
  end

  def edit
    get_group
    @users = User.all
  end

  def update
    get_group
    if @group.update(group_params)
       redirect_to group_messages_path(@group.id) , notice: "グループ編集に成功しました"
    else
      flash.now[:alert] = 'グループは編集されませんでした'
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, {user_ids: []} )
  end

  def get_group
    @group = Group.find(params[:id])
  end

end
