class TastesController < ApplicationController
  def index
    @taste = Taste.all
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

  private

  def taste_params
    params.require(:taste).permit(:title, :example, :image, :genre_id, taste_seasonings_attributes: [:seasoning_name, :quantity]).merge(user_id: current_user.id)
  end
end
