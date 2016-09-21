class Listing < ActiveRecord::Base
  mount_uploaders :listing_photos, ListingPhotosUploader
  belongs_to :user
  acts_as_taggable_on :keyword_description, :pet_presence

  def self.search(search, pet_presence)
    @selected_listings = Listing.tagged_with(search.split(" "), :on => :keyword_description, :any => true).tagged_with(pet_presence, :on => :pet_presence, :any => true)
    return @selected_listings
  end

end
