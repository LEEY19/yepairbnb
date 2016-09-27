class Listing < ActiveRecord::Base
  searchkick text_start: [:title], autocomplete: [:title], suggest: [:title], match: :word_start, searchable: [:title]
  
  has_many :listingphotos, dependent: :destroy
  has_many :reservations
  belongs_to :user
  acts_as_taggable_on :keyword_description, :pet_presence


  def self.searchh(search, pet_presence)
    @selected_listings = Listing.tagged_with(search.split(" "), :on => :keyword_description, :any => true).tagged_with(pet_presence, :on => :pet_presence, :any => true)
    return @selected_listings
  end

end



