class School < ApplicationRecord
  has_many :teachers, dependent: :destroy

  validates :name, presence: true
end
