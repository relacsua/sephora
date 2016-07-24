class Category < ActiveRecord::Base
	# Associations
	has_many :sub_categories, dependent: :destroy
	has_many :products, through: :sub_categories

	# Validations
	validates :name, presence: true
	validates :name, length: { in: 6..25 }
	validates :name, uniqueness: true
end