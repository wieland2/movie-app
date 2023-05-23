class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def new
    @like = Like.new
  end

  def create
    @user = User.find(current_user.id)
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.save
    redirect_to @like.likeable
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to @like.likeable
  end

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
  end

end
