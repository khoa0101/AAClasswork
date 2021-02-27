class CatsController < ApplicationRecord
  def index
    cats = Cat.all

    render json: cats
  end

  def show
    current_cat = Cat.find_by(id: params[:id])

    render json: cats
  end

  
end