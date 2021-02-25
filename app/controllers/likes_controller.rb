class LikesController < ApplicationController
  before_action :taste_params

  # いいねの実行
  def create
    Like.create(user_id: current_user.id, taste_id: params[:id])
  end

  # いいねのリセット
  def destroy
    Like.find_by(user_id: current_user.id, taste_id: params[:id]).destroy
  end

  private

  def taste_params
    @taste = Taste.find(params[:id])
  end
end
