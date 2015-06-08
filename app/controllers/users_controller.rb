class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:show]

  def index
    case params[:people] when "friends"
      @users = current_user.active_friends
    when "requests"
      @users = current_user.pending_friend_requests_from.map(&:user)
    when "pending"
      @users = current_user.pending_friend_requests_to.map(&:friend)
    else 
      @users = User.where.not(id: current_user.id)
    end

    @friend_count = current_user.active_friends.count
    @request_count = current_user.pending_friend_requests_from.count
    @pending_count = current_user.pending_friend_requests_to.count
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end