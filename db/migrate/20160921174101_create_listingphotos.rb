class CreateListingphotos < ActiveRecord::Migration
  def change
    create_table :listingphotos do |t|
      t.string :image
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
