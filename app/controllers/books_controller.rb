class BooksController < ApplicationController
  def index
    @books = Books::Models::Book.all.order(:id)
    @users = Users::Models::User.all.order(:id)
  end

  def return
    command_bus.call(Books::Commands::Return.new({book_id: params[:id]}))
    redirect_to books_path
  end

  def borrow
    command_bus.call(Books::Commands::Borrow.new({book_id: params[:id], user_id: params[:book][:user_id]}))
    redirect_to books_path
  end

  def show
    @book = Books::Models::Book.find(params[:id])
    @events = event_store.read.stream("Books::Aggregates::Book$#{params[:id]}")
  end
end