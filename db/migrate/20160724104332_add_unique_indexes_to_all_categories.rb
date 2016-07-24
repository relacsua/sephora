class AddUniqueIndexesToAllCategories < ActiveRecord::Migration
  def change
  	add_index_options :categories, [:name], unique: true
  	add_index_options :sub_categories, [:name], unique: true
  	add_index_options :sub_sub_categories, [:name], unique: true
  end
end
