module ApplicationHelper
  def string_time_format(time_in_minutes)
    hours = time_in_minutes / 60
    minutes = time_in_minutes - hours * 60
    minutes = "0#{minutes}" if minutes < 10
    "#{hours}:#{minutes}"
  end
end
