class Animal < ApplicationRecord
	mount_uploader :avatar, AnimalUploader
end
