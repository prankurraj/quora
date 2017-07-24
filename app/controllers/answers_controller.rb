class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    if current_user
      @answer.user_id = current_user.id
    
    end

    @question=Question.find(@answer.question_id)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to '/', notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
        format.js{   }
      else
        format.html { render 'home/index' }
        format.js{  }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content, :user_id, :question_id)
    end
end
