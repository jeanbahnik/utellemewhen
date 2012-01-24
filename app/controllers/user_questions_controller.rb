class UserQuestionsController < ApplicationController
  
  before_filter :require_user, only: :create
  
  def create
    event = Event.find(params[:event])
    user_question = UserQuestion.new
    user_question.user = current_user
    user_question.question = event.questions.first
    user_question.save
    redirect_to current_user
  end
  
  def destroy
    current_user.user_questions.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js
      format.html { redirect_to user_path(current_user) }
      format.json { head :ok }
    end
  end

end
