class SubSubCategory < ActiveRecord::Base
	# Associations
	belongs_to :sub_category
	has_many :products, dependent: :destroy

	# Validations
	validates :name, presence: true
	validates :name, length: { in: 6..25 }
	validates :name, uniqueness: true
end
