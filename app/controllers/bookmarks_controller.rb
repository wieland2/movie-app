class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    if params[:movie_id].nil?
      @list = List.find(params[:list_id])
      @movie = Movie.find(params[:bookmark][:movie_id])
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.list = @list
      if @bookmark.save
      redirect_to list_path(@list)
      end
    else
      @movie = Movie.find(params[:movie_id])
      @list = List.find(params[:bookmark][:list_id])
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.movie = @movie
      @bookmark.save
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end


  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id)
  end
  
end
