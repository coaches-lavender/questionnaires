class Question < ApplicationRecord
  belongs_to :question_group
  has_many :answers, dependent: :destroy

  enum :answer_type, scored: "scored", bool: "bool"
end
