class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all
  end

  def show
    @questionnaire = Questionnaire.find_by!(slug: params[:slug])
  end

  def create
    user = find_or_create_user

    questionnaire = Questionnaire.find(params[:questionnaire_id])

    ActiveRecord::Base.transaction do
      params[:answers].each do |question_id, score|
        Answer.create!(
          question_id: question_id,
          score: score,
          user_id: user.id
        )
      end
    end

    redirect_to questionnaire, notice: "Спасибо за ваши ответы!"
  rescue ActiveRecord::RecordInvalid
    redirect_to questionnaire, alert: "Ошибка при сохранении ответов"
  end

  private

  def find_or_create_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      return user if user
    end

    user = User.create!(name: params[:user_name], last_4_digits: params[:user_last_4_digits])
    session[:user_id] = user.id
    user
  end
end
