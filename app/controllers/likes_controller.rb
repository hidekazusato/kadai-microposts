class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    micropost.favorite(current_user)
    flash[:success] = 'micropostsをお気に入りに入れました。'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    micropost.unfavorite(current_user)
    flash[:success] = 'micropostsを気に入りを解除しました。'
    redirect_to current_user
  end
end