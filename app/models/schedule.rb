class Schedule < ApplicationRecord
  belongs_to :student
  belongs_to :section

  validates :first_name, :last_name, :classroom_id, presence: true
end