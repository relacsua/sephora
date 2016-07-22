class ChangeColumnNameInSubSubCategory < ActiveRecord::Migration
  def change
  	rename_column :sub_sub_categories, :subcategory_id, :sub_category_id
  end
end
