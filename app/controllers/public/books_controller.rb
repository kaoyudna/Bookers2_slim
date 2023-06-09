class Public::BooksController < ApplicationController

  def index
    selection = params[:keyword]
    @books = Book.sort(selection)
    @book = Book.new
  end

  def new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to @book
    else
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @post_comments = @book.post_comments
    @post_comment = PostComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
