class Api::V1::QuestionsController < ApplicationController

  def list
      @questions = Question.publics.has_answer.includes([answers: :user],:user)

      render json: @questions.as_json(only:[:id,:content],
        include: { answers: {only: [:id, :content],
                   include: { user: {only: [:id,:full_name]}}},
                   user: {only: [:id,:full_name]}
                  })


  end

end
