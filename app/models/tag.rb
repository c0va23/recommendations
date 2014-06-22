class Tag < ActiveRecord::Base
  validates :value, presence: true, uniqueness: { case_sensitive: false }

  has_many :tag_of_things, dependent: :destroy
  has_many :things, through: :tag_of_things

  def self.recommendations_for(user)
    self.joins(:things => :scores).where(scores: { user_id: user }).
      group('tags.id').having('sum(scores.value) >= 0 AND count(scores.id) > 0')
  end
end
