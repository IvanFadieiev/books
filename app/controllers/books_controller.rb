class BooksController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  load_and_authorize_resource except: [:create]
  skip_authorize_resource only: [:index, :show, :new]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body, :author, :draft)
  end
end