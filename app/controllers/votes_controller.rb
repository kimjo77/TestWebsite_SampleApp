class VotesController < ApplicationController
  before_action :logged_in_user

  def create
    post = Micropost.find(params[:micropost_id])
    current_user.like(post)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Vote.find(params[:id]).micropost
    current_user.unlike(post)
    redirect_back(fallback_location: root_path)
  end
end