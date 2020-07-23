class Character < ApplicationRecord
  belongs_to :user
  belongs_to :story
  include Commentable

  validates_presence_of :name, :age, :species, :gender, :story_id

  # Scopes
  include RecentlyCreated
end
