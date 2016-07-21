class School < ApplicationRecord
  has_many :teachers, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true
end
