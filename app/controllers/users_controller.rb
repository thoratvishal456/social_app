# frozen_string_literal: true

# users can follow any other user
class UsersController < ApplicationController
  before_action :authenticate_user!

  def search
    result = User.search(params[:input]) || []
    render json: { data: result }, status: :ok
  end

  def follow
    followable = User.find_by(id: params[:followable_id])
    current_user.follow(followable)
    render json: { data: { followable: followable } }, status: :ok
  end
end
