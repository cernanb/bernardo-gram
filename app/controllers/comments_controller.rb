class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @post.comments.order("created_at ASC")

    respond_to do |f|
      f.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js
      end
    else
      flash[:alert] = "Check the comment form please, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
