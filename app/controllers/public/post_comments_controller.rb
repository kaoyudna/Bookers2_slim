class Public::PostCommentsController < ApplicationController
  
  def create
    post_comments = current_user.post_comments
    if current_user.post_comment.save(post_comment_params)
  end
  
  def destroy
  end
  
end
