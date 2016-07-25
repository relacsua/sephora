class MainController < ApplicationController

	def view
		@product_cate = nil
		@category_name = nil
		@sub_category_name = nil
		@sub_sub_category_name = nil
		if params[:cat]
			@product_cate = Category.where('lower(name) = ?', params[:cat]).first
			@category_name = @product_cate.name
		end
		if params[:subcat]
			@product_cate = @product_cate.sub_categories.where('lower(name) = ?', params[:subcat]).first
			@sub_category_name = @product_cate.name
		end
		if params[:subsubcat]
			@product_cate = @product_cate.sub_sub_categories.where('lower(name) = ?', params[:subsubcat]).first
			@sub_sub_category_name = @product_cate.name
		end
		# render plain: getNestedCategories.to_json
		@menu = getNestedCategories

		@products = @product_cate ? @product_cate.products : Product.all

	end


	private

	def getNestedCategories
		nest = Hash.new
		categories = Category.all

		categories.each do |category|
			sub_cats = []
			category.sub_categories.each do |sub_category|
				sub_cat = Hash.new
				sub_cat[sub_category.name] = sub_category.sub_sub_categories.pluck(:name)
				sub_cats.push(sub_cat)
			end
			nest[category.name] = sub_cats
		end

		nest
	end

end
