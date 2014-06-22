class Score < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user

  validates :thing, presence: true
  validates :user, presence: true
  validates :value, presence: true, inclusion: { in: [ -1, 1 ] }
end
