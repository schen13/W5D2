class PostsController < ApplicationController
  # before_action :require_logged_in
  
  def new
    @post = Post.new

    # debugger
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.sub_id = 1
    if @post.save 
      p @post
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
    
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = ['no']
      render :edit
    end
  end
  
  def show
    @post = Post.find(params[:id])  
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
  end
end
