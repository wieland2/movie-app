class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
    @list = List.new
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.new
    @like = Like.new
  end

  def new
    @list = List.new
  end

  def create
    @user = User.find(current_user.id)
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
    redirect_to list_path(@list)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description, :user_id)
  end
end
