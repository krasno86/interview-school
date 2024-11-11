class Section < ApplicationRecord
  has_many :schedules

  belongs_to :classroom
  belongs_to :teacher
  belongs_to :subject

  validates :work_day, :duration, :start_lesson, :teacher_id, :subject_id, :classroom_id, presence: true
  validates :teacher, uniqueness: {scope: [:subject, :classroom]}
  validates :duration, inclusion: { in: [50, 80] }
  validates :work_day, numericality: { in: 1..3 }
  validates :start_lesson, numericality: { in: 450..1270 }
end