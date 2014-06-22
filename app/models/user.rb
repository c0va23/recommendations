class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :scores, dependent: :destroy
  has_many :things, through: :scores
  has_many :comments, dependent: :destroy
end
