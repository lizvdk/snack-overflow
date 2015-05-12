class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if params[:vote][:votable_type] == 'Question'
      @votable = Question.find(params[:vote][:votable_id])
    end

    respond_to do |format|
      if @vote.save
        format.js
      else
        format.html { render :back, notice: "failure"}
      end
    end
  end


  private

  def vote_params
    params.require(:vote).permit(:value, :votable_type, :votable_id)
  end
end
