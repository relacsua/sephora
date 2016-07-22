class AddSubSubCategoryColumnToProduct < ActiveRecord::Migration
  def change
  	add_reference :products, :sub_sub_category, index: true
  end
end
