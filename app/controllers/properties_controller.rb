class PropertiesController < ApplicationController

  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
      else
        if @post.save
          redirect_to posts_path, notice: "ブログを作成しました！"
        else
          render :new
        end
      end
    end

  def show

  end

  def edit

  end

  def destroy
    @property = Property.find(params[:id])
    if @property.delete
      flash[:notice] = 'station deleted!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to delete this property!'
      render :destroy
  end
end

  def update
    #@property = Property.find(params[:id])   # Overlap!
    if @property.update(property_params)
      redirect_to properties_path, notice: "I edited the property!"
    else
      render :edit
    end
  end


  def set_post
        @property = Property.find(params[:id])
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice:"I deleted the property!"
  end

  private
  def property_params
    params.require(:property).permit(:propertyName, :rent, :railName, :buildAge, :address, :note)
  end

end
