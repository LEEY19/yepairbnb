class RemoveListingPhotosFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :listing_photos, :json
  end
end
