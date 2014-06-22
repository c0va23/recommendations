class Tag < ActiveRecord::Base
  validates :value, presence: true, uniqueness: { case_sensitive: false }

  has_many :tag_of_things, dependent: :destroy
  has_many :things, through: :tag_of_things
end
