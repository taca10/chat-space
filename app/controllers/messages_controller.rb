class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]
  before_action :set_message, only: [:index, :create]

  def index
    respond_to do |format|
      format.html
      format.json { render json: @message }
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@message.group_id)
        }
        format.json
      end
        # flash[:notice] = "メッセージが送信されました！"
    else
      flash.now[:alert] = 'グループは作成されませんでした'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.includes(:messages)
    @users = @group.users.includes(:messages)
  end

  def set_message
    @message = Message.new
    @messages = @group.messages
  end
end
