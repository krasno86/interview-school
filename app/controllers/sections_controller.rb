class SectionsController < ApplicationController
  def index
    @sections_from_schedule = Student.first.schedules.pluck(:section_id).uniq
  end

  def create
    @sections_from_schedule = Student.first.schedules.pluck(:section_id).uniq
    if section
      section.lesson_days.each do |day|
        section.schedules.create!(student_id: Student.first.id, work_day: day, start_lesson: section.start_lesson, end_lesson: section.end_lesson)
      end

      redirect_to sections_path
    else
      flash[:notice] = 'Section not found.'
      render :index
    end
  end

  def destroy
    section.schedules.where(student_id: Student.first.id).destroy_all if section
    redirect_to sections_path
  end

  def download_pdf
    @schedules = Student.first.schedules
    pdf_html = ActionController::Base.new.render_to_string(template: 'sections/download_pdf')
    pdf = WickedPdf.new.pdf_from_string(pdf_html)
    send_data pdf, filename: 'file.pdf'
  end

  private

  def section
    @section ||= Section.find(params[:id])#Resque error
  end

  def sections
    @sections ||= current_student.sections
  end

  def current_student
    @student ||= Student.includes(:sections).first
  end
end
