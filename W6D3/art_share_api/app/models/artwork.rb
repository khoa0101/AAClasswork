class Artwork < ApplicationRecord
  validates :title, :img_url, :artist_id, null: false
  validates :title, uniqueness: { scope: :artist_id }

  
end
