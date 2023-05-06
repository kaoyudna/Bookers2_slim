class Public::PostCommentsController < ApplicationController

  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    @book = Book.find(params[:book_id])
    @post_comment.book_id = @book.id
    @post_comment.save
  end

  def destroy
    @book = Book.find(params[:id])
    current_user.post_comments.find_by(book_id: @book.id).destroy
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
