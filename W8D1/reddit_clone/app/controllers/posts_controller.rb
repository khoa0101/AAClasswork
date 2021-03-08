class PostsController < ApplicationController
  
  before_action :require_login, except:[:show]

  def new
    @post = Post.new
    render :new
  end
  
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    if @post.author_id == current_user.id
      render :edit
    else
      flash[:errors] = ["Only author can edit it!"]
      redirect_to post_url(@post)
    end
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
  def post_params
    self.params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end

end
