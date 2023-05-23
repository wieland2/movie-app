class PostsController < ApplicationController
  before_action :set_movie,  only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.movie = @movie
    if @post.save
    redirect_to movie_path(@movie)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post.movie
  end

  def post_params
    params.require(:post).permit(:movie_id, :user_id, :content)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
