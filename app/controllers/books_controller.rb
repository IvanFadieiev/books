# books controller
class BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_uniq
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  load_and_authorize_resource except: [:create, :update]
  skip_authorize_resource only: [:index, :show, :new]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :draft_book, only: [:show]

  def index
    @books = Book.all
  end

  def show
    @book.update_attributes(params[:draft]) if params[:draft]
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    @book.categories << Category.find(params[:category_ids]) if params[:category_ids]
    if @book.save
      redirect_to @book, notice: 'Book was successfully created!'
    else
      render :new
    end
  end

  def update
    @book.categories = Category.find(params[:category_ids]) if params[:category_ids]
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

  def last_books
    @books = Book.where("created_at > ?", 7.days.ago)
  end

  private

  def draft_book
    redirect_to :root if @book.draft && (current_user.id != @book.user_id)
  end

  def record_not_uniq
    redirect_to :back, notice: "Record not unique"
  end

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body, :author, :draft, :preview)
  end
end
