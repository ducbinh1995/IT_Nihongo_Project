class Image < ApplicationRecord
	mount_uploader :file, ImageUploader

	belongs_to :user
	belongs_to :animal
end
