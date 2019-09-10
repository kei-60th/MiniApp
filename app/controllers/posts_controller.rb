class PostsController < ApplicationController
  before_action :authenticate_user!,except: :index

  def index
    @posts = Post.all.order("id DESC")
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to action: :index
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to action: :index
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: :index
  end



  private
  def post_params
    params.permit(:title, :text).merge(user_id: current_user.id)
  end

end
