class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  # def create
  #   room = Entry.find_by(user_id: current_user.id, teacher_id: params[:teacher_id])
  #   if room.nil?
  #       room = Room.create
  #       Entry.find_or_create_by(user_id: current_user.id, teacher_id: params[:teacher_id], room_id: room.id)
  #       redirect_to admin_room_path(room)
  #   else
  #       redirect_to admin_room_path(room.room_id)
  #   end
  # end

  def index
    # 管理者所属ルームID取得
    # @user = User.all
    # @entries = @user.entries
    # @teacher_room_id = []
    # @teacher.entries.each do |entry|
    #     @teacher_room_id << @teacher_room_id
    # end
     # teacher.idで user.idを取得

    @entries = current_user.entries
  end

  def show
    # @room = Room.find(params[:id])
    # @chats = @room.chats.all
    # @chat = Chat.new
    # @entries = @room.entries
    # @teacher = Teacher.all
    # @teacher_entry = @entries.where.not(user_id: @teacher_id).first
    @chats = Chat.where(room_id: params[:id]).order(created_at: :asc)
    @chat = Chat.new
  end
end