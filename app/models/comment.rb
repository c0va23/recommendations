class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :thing

  validates :message, presence: true
  validates :user, presence: true
  validates :thing, presence: true

  delegate :name, to: :user, prefix: true
end
