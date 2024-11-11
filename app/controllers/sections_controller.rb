class SectionsController < ApplicationController
  def index
    @sections = Student.first.classroom.sections
    @sections_from_schedule = Student.first.schedules.pluck(:section_id).uniq
  end

  def create
    section = Section.where(id: params[:id]).first
    @sections = Student.first.classroom.sections
    @sections_from_schedule = Student.first.schedules.pluck(:section_id).uniq
    if section
      range = (section.start_lesson..section.end_lesson)
      exists_schedules = Schedule.where(student_id: Student.first.id, work_day: section.lesson_days, start_lesson: range).or(section.schedules.where(student_id: Student.first.id, work_day: section.lesson_days, end_lesson: range))
      if exists_schedules.blank?
        section.lesson_days.each do |day|
          section.schedules.create!(student_id: Student.first.id, work_day: day, start_lesson: section.start_lesson, end_lesson: section.end_lesson)
        end

        redirect_to sections_path
      else
        flash[:notice] = 'There is already an entry in the schedule for this time.'
        render :index
      end
    else
      flash[:notice] = 'Section not found.'
      render :index
    end
  end

  def destroy
    section = Section.where(id: params[:id]).first
    section.schedules.where(student_id: Student.first.id).destroy_all if section
    redirect_to sections_path
  end

  def download_pdf
    @schedules = Student.first.schedules
    pdf_html = ActionController::Base.new.render_to_string(template: 'sections/download_pdf')
    pdf = WickedPdf.new.pdf_from_string(pdf_html)
    send_data pdf, filename: 'file.pdf'
  end
end
