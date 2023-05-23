class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @list = List.all
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.all
    @posts = @movie.posts
    @post = Post.new
    @comment = @post.comments.build
    @comments = @post.comments
    @like = Like.new
  end

end
