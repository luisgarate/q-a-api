class Api::V1::QuestionsController < ApplicationController

  def list
      @questions = Question.publics.has_answer.includes([answers: :user],:user)
      @questions = @questions.by_items_in(params[:search].gsub(","," ")) if params[:search].present?

      render json: @questions.as_json(only:[:id,:content],
        include: { answers: {only: [:id, :content],
                   include: { user: {only: [:id,:full_name]}}},
                   user: {only: [:id,:full_name]}
                  })
  end

end
