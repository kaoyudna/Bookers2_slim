class Public::PostCommentsController < ApplicationController

  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    @book = Book.find(params[:book_id])
    @post_comment.save
    @post_comment.book_id = @book.id
    redirect_to request.referer
  end

  def destroy
    current_user.post_comments.find_by(book_id: params[:book_id]).destroy
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
