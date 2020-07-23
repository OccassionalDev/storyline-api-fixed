class Story < ApplicationRecord
  belongs_to :user
  has_many :characters
  include Commentable

  validates_presence_of :title, :summary
  validates_uniqueness_of :title

  # Scopes
  include RecentlyCreated
end
