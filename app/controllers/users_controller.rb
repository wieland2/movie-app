class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lists = List.where(user_id: params[:id])
    @list = List.new
    @friendship= Friendship.new
    @friendships = Friendship.where(asker_id: current_user.id, receiver_id: params[:id])
  end
end
