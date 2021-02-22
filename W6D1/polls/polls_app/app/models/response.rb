# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  respondent_id    :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
  validates :respondent_id, presence: true, uniqueness: true
  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'
  
  belongs_to :respondent,
    foreign_key: :respondent_id,
    class_name: 'User'

end
