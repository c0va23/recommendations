class Thing < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :tag_of_things, dependent: :destroy
  has_many :tags, through: :tag_of_things
  has_many :scores, dependent: :destroy
  has_many :users, through: :scores
end
