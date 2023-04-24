class Public::BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to request.referer
    else
      render 'error'
    end
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
