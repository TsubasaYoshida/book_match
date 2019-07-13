class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  before_action :set_variable, only: [:index, :narrow, :sort]

  def index
    @books = Book.all
  end

  def narrow
    if params[:author].blank?
      @books = Book.all
    else
      @author = params[:author]
      @books = Book.where(author: @author)
    end
    render :index
  end

  def sort
    if params[:created_at].present?
      @created_at = params[:created_at]

      if @created_at == '登録日時▲' || @created_at == '登録日時△'
        @books = Book.order(created_at: :DESC)
        @created_at = '登録日時▼'
      else
        @books = Book.order(created_at: :ASC)
        @created_at = '登録日時▲'
      end

    elsif params[:updated_at].present?
      @updated_at = params[:updated_at]

      if @updated_at == '更新日時▲' || @updated_at == '更新日時△'
        @books = Book.order(updated_at: :DESC)
        @updated_at = '更新日時▼'
      else
        @books = Book.order(updated_at: :ASC)
        @updated_at = '更新日時▲'
      end

    else
      @books = Book.all
    end
    render :index
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

  def set_variable
    @created_at = '登録日時△'
    @updated_at = '更新日時△'
  end
end
