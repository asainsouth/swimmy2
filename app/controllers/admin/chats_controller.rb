class Admin::ChatsController < ApplicationController

  def create
    chat = Chat.new(chat_params)
    if chat.save
      entry = Entry.find_by(teacher_id: current_teacher.id, room_id: chat.room_id)
      chat.create_notification_chat!(current_teacher, entry.user, chat.room_id)
      redirect_to admin_room_path(chat.room_id)
    else
      redirect_to admin_room_path(chat.room_id), alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message).merge(teacher_id: current_teacher.id, room_id: params[:room_id])
  end
end
