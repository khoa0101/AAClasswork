# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    byte_code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(:short_url => byte_code)
      byte_code = SecureRandom.urlsafe_base64
    end
    return byte_code
  end

  belongs_to :submitter,
    foreign_key: :user_id,
    class_name: :User

end
