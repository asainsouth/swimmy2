class Public::ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    @chat.save
    @name = ''
    @name = if @chat.user.full_name
              "#{@chat.user.full_name} さん:"
            else
              '未設定:'
            end
  end

  private

  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
