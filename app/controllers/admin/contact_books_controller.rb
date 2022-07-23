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
   @contact_books = @user.contact_books.page(params[:page]).per(10)
 end

 def show
   @user = User.find(params[:user_id])
   @contact_book = @user.contact_books.find(params[:id])
 end

 def edit
   @user = User.find(params[:user_id])
   @contact_book = @user.contact_books.find(params[:id])
   #@user= @contact_book.user
 end

 def update
   @user = User.find(params[:user_id])
   @contact_book = @user.contact_books.find(params[:id])
   if @contact_book.update(contact_book_params)
      redirect_to admin_user_contact_book_path(@user,@contact_book)
   else
      render :edit
   end
 end

 private

  def contact_book_params
    params.require(:contact_book).permit( :use_day, :is_active, :eat, :private_active, :group_active, :connection, :start_use_time, :finish_use_time, :user_id, :contact_book_image)
  end
end