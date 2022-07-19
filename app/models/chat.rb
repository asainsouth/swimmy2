class Chat < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :teacher, optional: true
  belongs_to :room
  has_many :notifications, dependent: :destroy

  def create_notification_chat!(current_user, chat_id, room_id, visited_id)
    # チャットしている相手を取得し、通知を送る
    temp_ids = Chat.select(:user_id).where(room_id: room_id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_chat!(current_user, chat_id, temp_id['user_id'])
    end
     # もしチャットが空だったら、投稿者に通知を送る
    save_notification_chat!(current_user, chat_id, visited_id) if temp_ids.blank?
  end

  def save_notification_chat!(current_user, chat_id, visited_id)
    # チャットは複数回することが考えられるため、複数回通知する
    notification = current_user.active_notifications.new(
      chat_id: chat_id,
      visited_id: visited_id,
      action: 'chat'
    )
    # 自分のチャットの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
