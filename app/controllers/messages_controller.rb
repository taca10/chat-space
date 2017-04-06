class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index

  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to  group_messages_path(@group), notice: 'メッセージ送信に成功しました'
    else
      flash.now[:alert] = 'グループは作成されませんでした'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end

  def get_group
  end

  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.order('created_at DESC')
    @users = @group.users
    @message = Message.new
    @messages = @group.messages
  end
end

