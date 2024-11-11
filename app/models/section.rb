class Section < ApplicationRecord
  has_many :schedules

  belongs_to :classroom
  belongs_to :teacher
  belongs_to :subject

  WORKING_DAYS = [[1, 3, 5], [2, 4], [1, 2, 3, 4, 5]].freeze

  validates :work_day, :duration, :start_lesson, :teacher_id, :subject_id, :classroom_id, presence: true
  validates :teacher, uniqueness: {scope: [:subject, :classroom]}
  validates :duration, inclusion: { in: [ 50, 80 ] }
  validates :work_day, numericality: { in: 0..2 }
  validates :start_lesson, numericality: { in: 450..1270 }

  def end_lesson
    start_lesson + duration
  end

  def work_days
    lesson_days.map { |day| Date::DAYNAMES[day] }.join(', ')
  end

  def lesson_days
    WORKING_DAYS[self.work_day]
  end
end