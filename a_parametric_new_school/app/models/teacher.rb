class Teacher < ApplicationRecord
  has_many :students, dependent: :destroy
  belongs_to :school

  validates :name, presence: true
end
