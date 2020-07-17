class Story < ApplicationRecord
  belongs_to :user
  has_many :characters
  include Commentable

  validates_presence_of :title, :summary
  validates_uniqueness_of :title

  scope :recently_created_stories, -> {
    recent_date = DateTime.now - 30
    where("created_at >= ?", recent_date)
  }
end
