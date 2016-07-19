class School < ApplicationRecord
  has_many :teachers
  has_many :students

  validates :name, presence: true
end
