class Thing < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :tag_of_things, dependent: :destroy
  has_many :tags, through: :tag_of_things
  has_many :scores, dependent: :destroy
  has_many :users, through: :scores
  has_many :comments, dependent: :destroy

  def self.unchecked_for(user)
    self.where.not(id: user.things.select('things.id'))
  end

  def self.checked_for(user)
    self.where(id: user.things.select('things.id'))
  end

  def self.recommendations_for(user)
    tag_ids = Tag.recommendations_for(user).select('tags.id')
    self.unchecked_for(user).joins(:tags).where(tags: { id: tag_ids}).uniq
  end

end
