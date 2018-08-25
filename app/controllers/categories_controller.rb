class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      # flash[] - figure out what else to put here for the sorry message - see saved bookmark
      render :new
    end
  end

  def show
    category = Category.find(params[:id])
    redirect_to categories_path(category)
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
