class MessagesController < ApplicationController

  before_action :get_group, only: [:index, :create]

  def index
    @groups = current_user.groups.order('created_at DESC')
    @users = @group.users
    @message = Message.new
    @messages = @group.messages
  end

  def new
  end

  def create
  Message.create(message_params)
  redirect_to  group_messages_path(@group)
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def get_group
  @group = Group.find(params[:group_id])
  end
end

