class CreateSubSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_sub_categories do |t|
      t.string :name
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
