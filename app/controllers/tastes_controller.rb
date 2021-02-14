class TastesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user, only: [:edit, :update]

  def index
    @taste = Taste.all.order(created_at: :desc)
  end

  def new
    @taste = Taste.new
    @taste.taste_seasonings.build
  end

  def create
    @taste = Taste.create(taste_params)
    if @taste.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @seasoning = TasteSeasoning.where(taste_id: params[:id])
  end

  def edit
  end

  def update
    if @taste.update(taste_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @taste.destroy if @taste.user_id == current_user.id
  end

  private

  def find_params
    @taste = Taste.find(params[:id])
  end

  def taste_params
    params.require(:taste).permit(:title, :example, :image, :recipe, :genre_id,
                                  taste_seasonings_attributes: [:id, :seasoning_name, :quantity, :_destroy]).merge(user_id: current_user.id)
  end

  def ensure_user
    @tastes = @taste.user_id == current_user.id
    redirect_to root_path unless @tastes
  end
end
