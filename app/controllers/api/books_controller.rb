class Api::BooksController < ApplicationController

  def index
    books = Book.all
    render :json => Api::BooksPresenter.new(books)
  end

  def show
    book = Book.find(params[:id])
    render :json => Api::BookPresenter.new(book)
  end

  def create
    book = Book.create! do |instance|
      instance.title = params[:book][:title]
      instance.summary = params[:book][:summary]
    end
    render :json => Api::BookPresenter.new(book), :status => :created
  end

  def update
    book = Book.find(params[:id])
    book.title = params[:book][:title]
    book.summary = params[:book][:summary]
    book.save!
    render :json => Api::BookPresenter.new(book), :status => :accepted
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render :nothing => true, :status => :accepted
  end
end
