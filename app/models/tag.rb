class Tag < ActiveRecord::Base
  validates :value, presence: true, uniqueness: { case_sensivite: false }
end
