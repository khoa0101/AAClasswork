class Post < ApplicationRecord
  validates :title, :author_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

  has_many :post_subs, inverse_of: :post,
    foreign_key: :post_id,
    class_name: 'PostSub'
    
  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments,
    foreign_key: :post_id,
    class_name: 'Comment'

  def comments_by_parent_id
    hash = Hash.new { |hash, key| hash[key] = [] }

    self.comments.includes(:author).each do |comment|
      hash[comment.parent_comment_id] << comment
    end

    hash

  end
end
