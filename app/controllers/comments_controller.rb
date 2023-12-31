class CommentsController < ApplicationController
  def create
    @comment = Comment.create(author_id: current_user.id, post_id: params['post_id'], text: params['text'])

    redirect_to user_post_path(params[:user_id], params[:post_id]) if @comment.save
  end
end
