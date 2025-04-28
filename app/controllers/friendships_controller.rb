class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end
  def create
    friend = User.find(params[:friend_id])
    current_user.friendships.create(friend: friend)
    redirect_to users_path, notice: "#{friend.email}さんを友達に追加しました。"
  end

  def destroy
    friendship = current_user.friendships.find(params[:id])
    friendship.destroy
    redirect_to users_path, notice: "友達を削除しました。"
  end
end
