class SubSubCategoriesController < ApplicationController

	def show
		@sub_sub_category = SubSubCategory.find(params[:id])
	end

	def new
		@category = Category.find(params[:category_id])
		@sub_category = SubCategory.find(params[:sub_category_id])
		@sub_sub_category = SubSubCategory.new
	end

	def create
		@category = Category.find(params[:category_id])
		@sub_category = SubCategory.find(params[:sub_category_id])
		@sub_sub_category = @sub_category.sub_sub_categories.new(sub_sub_category_params)

		if @sub_sub_category.save
			redirect_to category_sub_category_path(@category, @sub_category)
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:category_id])
		@sub_category = SubCategory.find(params[:sub_category_id])
		@sub_sub_category = SubSubCategory.find(params[:id])
	end

	def update
		@category = Category.find(params[:category_id])
		@sub_category = SubCategory.find(params[:sub_category_id])
		@sub_sub_category = SubSubCategory.find(params[:id])

		if @sub_sub_category.update(sub_sub_category_params)
			redirect_to category_sub_category_path(@category, @sub_category)
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:category_id])
		@sub_category = SubCategory.find(params[:sub_category_id])
		@sub_sub_category = SubSubCategory.find(params[:id])
		@sub_sub_category.destroy

		redirect_to category_sub_category_path(@category, @sub_category)		
	end

	private

	def sub_sub_category_params
		params.require(:sub_sub_category).permit(:name)
	end
end
