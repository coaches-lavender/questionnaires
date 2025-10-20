class Questionnaire < ApplicationRecord
  has_many :question_groups, dependent: :destroy
  has_many :questions, through: :question_groups

  def to_param
    slug
  end
end
