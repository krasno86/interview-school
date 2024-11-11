class Student < ApplicationRecord
  has_many :schedules
  belongs_to :classroom

  validates :first_name, :last_name, presence: true
end
