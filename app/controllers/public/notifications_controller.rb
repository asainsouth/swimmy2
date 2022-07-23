class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    pp @notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
      # binding.pry
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end