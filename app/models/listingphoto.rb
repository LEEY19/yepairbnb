class Listingphoto < ActiveRecord::Base
  belongs_to :listing
  mount_uploader :image, ImageUploader
end