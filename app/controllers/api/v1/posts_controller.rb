class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :asc)
    render json: @posts
  end
end
