# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    validates :name, :instructor_id, uniqueness: true

    belongs_to :instructor,
      foreign_key: :instructor_id,
      class_name: :User

    belongs_to :prerequisites,
      foreign_key: :prereq_id,
      class_name: :Course
      # optional: true

    has_many :enrollments,
      foreign_key: :course_id,
      class_name: :Enrollment

    has_many :enrolled_students,
      through: :enrollments,
      source: :user


    


end
