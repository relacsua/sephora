class SubSubCategory < ActiveRecord::Base
  belongs_to :sub_category
  has_many :products
end
