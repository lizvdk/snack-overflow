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

  def update
    if params[:best_answer].present?
      @question = current_user.questions.find(params[:id])
      @question.best_answer_id = params[:best_answer]
      @question.best_answer.is_best_answer = true

      if @question.save
        @question.best_answer_chosen!
        flash[:success] = 'Best answer awarded!'
        redirect_to question_path(@question)
      else
        render :show
        flash[:error] = 'Something went wrong.'
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, category_ids: [])
  end
end
