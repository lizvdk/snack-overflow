class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_update_user, only: [:update]

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      flash[:success] = "Answer posted sucessfully."
      redirect_to question_path(@answer.question)
    else
      render 'questions/show'
    end
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params.require(:answer).permit(:is_best_answer))
      flash[:notice] = 'Answer updated!'
    else
      flash[:error] = 'Something went wrong.'
    end
    redirect_to question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def authorize_update_user
    @answer = Answer.find(params[:id])
    if current_user != @answer.question.user
      flash[:notice] = 'You are not allowed to do that.'
      redirect_to root_path
    end
  end
end
