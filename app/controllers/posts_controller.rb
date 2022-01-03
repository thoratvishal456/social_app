# frozen_string_literal: true

# blog posts
class PostsController < ApplicationController
  before_action :authenticate_user!

  # user followers posts
  def index
    @posts = Post.where(user_id: current_user.following_users.ids)
    render json: { data: @posts }, status: :ok
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: { data: @post }, status: :ok
    else
      render json: { error: @post.errors.messages },
             status: :internal_server_error
    end
  end

  def post_params
    params.require(:post).permit(:content, :attachment)
  end
end
