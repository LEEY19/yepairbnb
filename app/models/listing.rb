class Listing < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    selected_entries = []
    Listing.all.each do |listing|
      if listing.tags.tr(' ', '').split(",").any? { |tag| search.include?(tag) }
        selected_entries << listing
      end
    end
    return selected_entries
  end

end
