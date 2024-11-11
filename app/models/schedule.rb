class Schedule < ApplicationRecord
  belongs_to :student
  belongs_to :section

  validates :work_day, :start_lesson, :end_lesson, :student_id, :section_id, presence: true
  validates :work_day, numericality: { in: 1..5 }
  validates :start_lesson, numericality: { in: 450..1270 }
  validates :end_lesson, numericality: { in: 500..1320 }

  def string_time_format(time_in_minutes)
    hours = time_in_minutes / 60
    minutes = time_in_minutes - hours * 60
    minutes = "0#{minutes}" if minutes < 10
    "#{hours}:#{minutes}"
  end

  def lesson_time
    "#{Date::DAYNAMES[work_day]}: #{string_time_format(start_lesson)} - #{string_time_format(end_lesson)}"
  end
end