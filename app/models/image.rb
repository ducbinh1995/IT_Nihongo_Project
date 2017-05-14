class Image < ApplicationRecord
	mount_uploader :file, ImageUploader

	belongs_to :user
	belongs_to :animal
	has_many :image_comment, -> { order "created_at DESC"}
	has_many :users, class_name: "LikedUser", :through => :image_likes 
	has_many :image_likes 
end
