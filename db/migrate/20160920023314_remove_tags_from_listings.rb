class RemoveTagsFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :tags, :string
  end
end
