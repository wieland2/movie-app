class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @user = User.find(params[:user_id])
    @friendship = Friendship.new
    if @user.id != current_user.id
    @friendship.asker_id = current_user.id
    @friendship.receiver_id = @user.id
    end
     if @friendship.save
      redirect_to @user
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to @friendship.receiver
  end
  
end
