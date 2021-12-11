class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end


  # Hiển thị tất cả các cateogory với phân trang
  def index
    @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  # Hiển thị một category và toàn bộ các articel cùng phân trang
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end

end