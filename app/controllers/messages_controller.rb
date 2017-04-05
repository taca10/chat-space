class MessagesController < ApplicationController

  before_action :get_group, only: [:index, :create]

  def index
    @groups = current_user.groups.order('created_at DESC')
    @users = @group.users
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to  group_messages_path(@group), notice: 'メッセージ送信に成功しました'
    else
      redirect_to  group_messages_path(@group), alert: 'メッセージ送信に成功しました'
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def get_group
  @group = Group.find(params[:group_id])
  end
end

