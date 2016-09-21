class AddListingPhotosToListings < ActiveRecord::Migration
  def change
    add_column :listings, :listing_photos, :json
  end
end
