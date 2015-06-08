class FriendshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:create]
  before_action :set_friendship, only: [:destroy, :accept]

  def create
    @friendshp = current_user.request_friendship(@user)
    redirect_to users_path, notice: "Friendship Created"
  end

  def destroy
    @friendsip.destroy
    redirect_to users_path, notice: "Friendship Deleted"
  end

  def accept
    @friendsip.accept_friendship
    redirect_to users_path, notice: "Friendship accepted"
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_friendship
    @friendsip = Friendship.find(params[:id])
  end

end