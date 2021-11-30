class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      render 'index'
    end
    
  end
  
  def index
    @posts = Post.all
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
   def post_params
     params.require(:post).permit(:title, :body, :image)
   end
  
end
