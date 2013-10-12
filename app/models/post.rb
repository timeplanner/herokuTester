class Post < ActiveRecord::Base
  attr_accessible :audio, :comment, :location, :user_id, :video
  belongs_to :user
  validates :user_id, :location, presence: true
  validates :comment, length: {maximum: 140}
  default_scope order: 'posts.created_at DESC'
end
