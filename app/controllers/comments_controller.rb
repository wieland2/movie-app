class CommentsController < ApplicationController

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
    redirect_to movie_path(@post.movie)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post.movie
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
  
end
