class AddUniqueToUrl < ActiveRecord::Migration[5.2]
  def change
    add_index :artworks, :img_url, unique: true
  end
end
