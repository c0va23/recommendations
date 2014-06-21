class TagOfThing < ActiveRecord::Base
  belongs_to :tag
  belongs_to :thing

  validates :tag, presence: true
  validates :thing, presence: true

  validates :tag_id, uniqueness: { scope: :thing_id }
end
