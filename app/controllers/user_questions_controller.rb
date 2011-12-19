class UserQuestionsController < ApplicationController

  # DELETE /races/1
  # DELETE /races/1.json
  def destroy
    uq = current_user.user_questions.find_all_by_question_id(params[:id])
    # uq.destroy_all <-- does not work
    uq.each { |x| x.destroy }

    respond_to do |format|
      format.js
      format.html { redirect_to user_path(current_user) }
      format.json { head :ok }
    end
  end

end
