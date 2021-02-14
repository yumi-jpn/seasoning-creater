class TastesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @taste = Taste.all.order(created_at: :desc)
  end

  def new
    @taste = Taste.new
    2.times { @taste.taste_seasonings.build }
  end

  def create
    @taste = Taste.new(taste_params)
    if @taste.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @taste = Taste.find(params[:id])
    @seasoning = TasteSeasoning.where(taste_id: params[:id])
  end

  private

  def taste_params
    params.require(:taste).permit(:title, :example, :image, :recipe, :genre_id,
                                  taste_seasonings_attributes: [:seasoning_name, :quantity]).merge(user_id: current_user.id)
  end
end
