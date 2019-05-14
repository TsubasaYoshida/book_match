class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @like_count = 20
    @review_count = 10
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: '書籍情報の登録に成功しました。'
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to @book, notice: '書籍情報の削除に成功しました。'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
