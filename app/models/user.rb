class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :scores, dependent: :destroy
  has_many :things, through: :scores
end
