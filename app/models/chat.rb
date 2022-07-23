class Chat < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :teacher, optional: true
  belongs_to :room
  has_many :notifications, dependent: :destroy

  def create_notification_chat!(teacher, user, room_id)
     # もしチャットが空だったら、投稿者に通知を送る
    save_notification_chat!(teacher, user, room_id)
  end

  def save_notification_chat!(teacher, user, room_id)
    # チャットは複数回することが考えられるため、複数回通知する
    teacher.active_notifications.find_or_create_by(
      room_id: room_id,
      visited_id: user.id,
      action: 'chat',
      checked: false
    )
    # FIXME: 自分のチャットの場合は、通知済みとするが、モデルが異なるため対策が必要
    #         ポリモーフィックを使用すれば解決できね可能性あり。
    #         -- ただし、今回は一方通行のため不要と判断しコメントアウト --
    # if notification.visitor_id == notification.visited_id
    #   notification.checked = true
    # end
    # notification.checked = false
    # notification.save if notification.valid?
  end
end
