class Public::PostCommentsController < ApplicationController

  def create
    @post_comments = current_user.post_comments.new(post_comment_params)
    @post_comments.book_id = params[:book_id]
    @post_comments.save
    redirect_to request.referer
  end

  def destroy
    current_user.post_comments.find_by(book_id: params[:book_id]).destroy
    redirect_to request.referer
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
