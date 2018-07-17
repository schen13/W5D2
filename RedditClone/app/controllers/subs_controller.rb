class SubsController < ApplicationController
  
  # before_action :require_logged_in
  def new
    @sub = Sub.new
  end
  
  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ['too explicit']
      render :new
    end
  end
  
  def edit
    @sub = Sub.find(params[:id])
  end
  
  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ['some message']
      render :edit
    end
  end
  
  def show
    @sub = Sub.find(params[:id])
  end
  
  def index
    @subs = Sub.all
  end
  
  def destroy
  
  end
  
  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end

