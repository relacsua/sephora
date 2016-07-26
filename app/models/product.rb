class Product < ActiveRecord::Base
	# Associations
	belongs_to :sub_sub_category
	has_attached_file :photo

	# Validations
	validates :name, :description, :price, :photo, presence: true
	validates :name, length: { in: 3..25 }
	validates :name, uniqueness: true
	validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
