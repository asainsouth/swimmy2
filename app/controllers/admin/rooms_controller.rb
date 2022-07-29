class Admin::RoomsController < ApplicationController
  def create
    room = Entry.find_by(user_id: params[:user_id], teacher_id: current_teacher.id)
    if room.nil?
      room = Room.create
      Entry.find_or_create_by(user_id: params[:user_id], teacher_id: current_teacher.id, room_id: room.id)
      redirect_to admin_room_path(room)
    else
      redirect_to admin_room_path(room.room_id)
    end
  end

  def index
    # 管理者所属ルームID取得
    # @teacher = Teacher.all
    # @entries = @teacher.entries
    # # @teacher_room_id = []
    # # @teacher.entries.each do |entry|
    # #     @teacher_room_id << @teacher_room_id
    # # end
    #  # teacher.idで user.idを取得
    # @user = current_user
    # @teacher_room_id = @teacher.entries.pluck(:id)
    # @current_entry = Entry.where(room_id: @teacher_room_id).where.not(teacher_id: @user)
  end

  def show
    @chats = Chat.where(room_id: params[:id]).order(created_at: :asc)
    @chat = Chat.new
  end
end
