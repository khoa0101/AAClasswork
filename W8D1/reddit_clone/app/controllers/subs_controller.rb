class SubsController < ApplicationController

  before_action :require_login, only:[:new, :create, :edit, :update]

  def new 
    @sub = Sub.new 
    render :new 
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save 
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_mesages
      render :new 
    end
  end

  def index 
    @subs = Sub.all 
    render :index 
  end

  def show
    @sub = Sub.find(params[:id])
    render :show 
  end

  def edit
    @sub = Sub.find(params[:id])
    # double = !!!!!!!!!!!!!!!!!!!
    if @sub.moderator_id == current_user.id 
      render :edit 
    else
      flash[:errors] = ["Only moderator can edit it!"]
      redirect_to sub_url(@sub)
    end
  end

  def update 
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else 
      flash.now[:errors] = @sub.errors.full_mesages
      render :edit 
    end
  end

  private 
  def sub_params
    self.params.require(:sub).permit(:title, :description, :moderator_id)
  end

  


end
