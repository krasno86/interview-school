Rails.logger = Logger.new(STDOUT)
Rake::Task['db:fixtures:load'].invoke

class_room = Classroom.create!(name: '2D')
class_room.students.create!(first_name: 'Bob', last_name: 'R')
class_room.students.create!(first_name: 'Garry', last_name: 'A')
class_room = Classroom.create!(name: '2A')
class_room.students.create!(first_name: 'Jack', last_name: 'K')

subject = Subject.create!(name: 'chemistry')
teacher = Teacher.create!(first_name: 'John', last_name: 'F')
subject.teacher_subjects.create!(teacher_id: teacher.id, level: TeacherSubject::DEFAULT_LEVEL)
Section.create!(classroom_id: Classroom.first.id, teacher_id: teacher.id, subject_id: subject.id, work_day: 0, duration: 50, start_lesson: 550)
Classroom.last.sections.create!(teacher_id: teacher.id, subject_id: subject.id, work_day: 1, duration: 50, start_lesson: 550)
teacher = Teacher.create!(first_name: 'Tom', last_name: 'G')
subject.teacher_subjects.create!(teacher_id: teacher.id, level: TeacherSubject::DEFAULT_LEVEL)
Classroom.first.sections.create!(teacher_id: teacher.id, subject_id: subject.id, work_day: 1, duration: 50, start_lesson: 450)

subject = Subject.create!(name: 'physics')
teacher = Teacher.create!(first_name: 'Jack', last_name: 'H')
subject.teacher_subjects.create!(teacher_id: teacher.id, level: TeacherSubject::DEFAULT_LEVEL)
Classroom.first.sections.create!(teacher_id: teacher.id, subject_id: subject.id, work_day: 2, duration: 80, start_lesson: 680)

subject = Subject.create!(name: 'mathematics')
teacher = Teacher.create!(first_name: 'John', last_name: 'S')
subject.teacher_subjects.create!(teacher_id: teacher.id, level: TeacherSubject::DEFAULT_LEVEL)
Classroom.first.sections.create!(teacher_id: teacher.id, subject_id: subject.id, work_day: 0, duration: 50, start_lesson: 780)

subject = Subject.create!(name: 'geography')
teacher = Teacher.create!(first_name: 'Bill', last_name: 'R')
subject.teacher_subjects.create!(teacher_id: teacher.id, level: TeacherSubject::DEFAULT_LEVEL)
Classroom.first.sections.create!(teacher_id: teacher.id, subject_id: subject.id, work_day: 2, duration: 80, start_lesson: 500)

teacher = Teacher.create!(first_name: 'Michel', last_name: 'X')
subject.teacher_subjects.create!(teacher_id: teacher.id, level: TeacherSubject::DEFAULT_LEVEL)
Classroom.first.sections.create!(teacher_id: teacher.id, subject_id: subject.id, work_day: 0, duration: 50, start_lesson: 530)
