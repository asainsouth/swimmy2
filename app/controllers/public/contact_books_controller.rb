class Public::ContactBooksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contact_books = @user.contact_books.all.page(params[:page]).per(12)
    @contact_books = @contact_books.where('use_day LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
	@contact_book = ContactBook.find(params[:id])
  end
  private

  def contact_book_params
    params.require(:contact_book).permit(:use_day, :is_active, :eat, :private_active, :group_active, :connection, :start_use_time, :finish_use_time, :user_id, :contact_book_image)
  end
end


