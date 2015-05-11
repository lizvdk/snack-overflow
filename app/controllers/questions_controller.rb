class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      flash[:success] = "Question posted sucessfully."
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def index
    @questions = Question.recent_first.all
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
