class SubCategory < ActiveRecord::Base
	# Associations
	belongs_to :category
	has_many :sub_sub_categories, dependent: :destroy
	has_many :products, through: :sub_sub_categories

  	# Validations
	validates :name, presence: true
	validates :name, length: { in: 3..25 }
	validates :name, uniqueness: true
end
