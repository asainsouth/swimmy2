class Public::ChatsController < ApplicationController

  def create
    chat = Chat.new(chat_params)
    if chat.save!
      # chat.create_notification_chat!(Teacher.find(chat.teacher_id), chat.id, chat.room_id, chat.user_id, 'user')
      redirect_to room_path(chat.room_id)
    else
      redirect_to room_path(chat.room_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end