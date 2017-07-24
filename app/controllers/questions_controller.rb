class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  
  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    # @answer=Answer.new
    respond_to do |format|
      if @question.save
        format.html { redirect_to '/', notice: 'Question was successfully created.' }
                format.js{}

        format.json { render :show, status: :created, location: @question }
      else 
        format.html { render 'home/index' }
        format.js{}
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :user_id)
    end
end
