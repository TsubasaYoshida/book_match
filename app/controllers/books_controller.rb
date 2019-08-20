class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  before_action :set_variable, only: [:index, :narrow, :sort]

  def index
  end

  def narrow
    narrow_by_author
    page_by_kaminari
    render :index
  end

  def sort
    narrow_by_author

    if params[:created_at].present?
      @created_at_num = params[:created_at].to_i

      if @created_at_num == 0
        @books = @books.order(created_at: :DESC)
        @created_at = '登録日時▼'
        @created_at_num = 1
      else
        @books = @books.order(created_at: :ASC)
        @created_at = '登録日時▲'
        @created_at_num = 0
      end

    elsif params[:updated_at].present?
      @updated_at_num = params[:updated_at].to_i

      if @updated_at_num == 0
        @books = @books.order(updated_at: :DESC)
        @updated_at = '更新日時▼'
        @updated_at_num = 1
      else
        @books = @books.order(updated_at: :ASC)
        @updated_at = '更新日時▲'
        @updated_at_num = 0
      end

    end
    page_by_kaminari
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
    @created_at_num = 0
    @updated_at_num = 0
  end

  def narrow_by_author
    if params[:author].blank?
      @books = Book.all
    else
      @author = params[:author]
      @books = Book.where(author: @author)
    end
  end

  def page_by_kaminari
    @books = @books.page(params[:page]).per(PER)
  end

end
