class Classroom < ApplicationRecord
  has_many :students
  has_many :sections

  validates :name, presence: true
end