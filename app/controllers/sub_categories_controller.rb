class SubCategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.new
  end  

  def create
    @category = Category.find(params[:category_id])
    @sub_category = @category.sub_categories.new(sub_category_params)

    if @sub_category.save
      redirect_to category_sub_category_path(@category, @sub_category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:id])

    if @sub_category.update(sub_category_params)
      redirect_to category_sub_category_path(@category, @sub_category)
    else
      render 'edit'
    end

  end

  def destroy
    @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy

    redirect_to @category
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name)
  end

end
