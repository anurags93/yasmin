class Image < ApplicationRecord
	belongs_to :imagable, polymorphic:true, optional: true

	mount_uploader :image, ImageUploader
end
