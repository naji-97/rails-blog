class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find_by(id: params[:id])

    return unless @user.nil?

    render html: 'User not found', status: :not_found
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
