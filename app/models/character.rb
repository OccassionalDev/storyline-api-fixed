class Character < ApplicationRecord
  belongs_to :user
  belongs_to :story
  include Commentable

  validates_presence_of :name, :age, :species, :gender, :story_id

  scope :recently_created_characters, -> {
    recent_date = DateTime.now - 30
    where("created_at >= ?", recent_date)
  }
end
