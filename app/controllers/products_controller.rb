class ProductsController < ApplicationController
	def index
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@products = @sub_sub_category.products
	end

	def show
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@sub_category = @sub_sub_category.sub_category
		@category = @sub_category.category
		@product = Product.find(params[:id])
	end

	def new
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@sub_category = @sub_sub_category.sub_category
		@category = @sub_category.category
		@product = @sub_sub_category.products.new
	end

	def create
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@sub_category = @sub_sub_category.sub_category
		@category = @sub_category.category
		@product = @sub_sub_category.products.new(product_params)

		if @product.save
			redirect_to category_sub_category_sub_sub_category_products_path(@category, @sub_category, @sub_sub_category)
		else
			render 'new'
		end
	end

	def edit
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@sub_category = @sub_sub_category.sub_category
		@category = @sub_category.category
		@product = Product.find(params[:id])
	end

	def update
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@sub_category = @sub_sub_category.sub_category
		@category = @sub_category.category
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to category_sub_category_sub_sub_category_products_path(@category, @sub_category, @sub_sub_category)
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@sub_sub_category = SubSubCategory.find(params[:sub_sub_category_id])
		@sub_category = @sub_sub_category.sub_category
		@category = @sub_category.category
		@product.destroy

		redirect_to category_sub_category_sub_sub_category_products_path(@category, @sub_category, @sub_sub_category)
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :photo)
	end
end
