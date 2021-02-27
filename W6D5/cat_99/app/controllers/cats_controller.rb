class CatsController < ApplicationController
  def index
    @cats = Cat.all

    render :index
  end

  def show
    current_cat = Cat.find_by(id: params[:id])

    render json: cats
  end

  def new
    @current_cat = Cat.new

    render :new
  end

  def edit

  end

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end