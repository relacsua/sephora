class Product < ActiveRecord::Base
	belongs_to :sub_sub_category
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
