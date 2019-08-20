class ApplicationController < ActionController::Base
  before_action :set_search

  PER = 5

  def set_search
    @search = Book.ransack(params[:q])
    @books = @search.result.page(params[:page]).per(PER)
  end

end
