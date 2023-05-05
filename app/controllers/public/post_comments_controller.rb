class Public::PostCommentsController < ApplicationController

  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    @book = Book.find(params[:book_id])
    if @post_comment.save
      @post_comment.book_id = @book.id
    end
  end

  def destroy
    current_user.post_comments.find_by(book_id: params[:book_id]).destroy
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
