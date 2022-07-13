class Admin::ContactBooksController < ApplicationController

 def new
   @contact_book = ContactBook.new
 end

 def create
    @contact_book = ContactBook.new(contact_book_params)
    if @contact_book.save
    redirect_to admin_user_contact_book_path(@contact_book.user_id,@contact_book.id)
    else
    render:new
    end
 end

 def index
   @user = User.find(params[:user_id])
   @contact_books = @user.contact_books.page(params[:page])
 end

 def show
   @contact_book = ContactBook.find(params[:id])
   @user= @contact_book.user
 end

end

 private

  def contact_book_params
    params.require(:contact_book).permit( :use_day, :is_active, :eat, :private_active, :group_active, :connection, :start_use_time, :finish_use_time, :user_id)
  end