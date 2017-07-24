class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id=current_user.id
   @answer=Answer.find(@comment.answer_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to '/', notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js{ }
      else
        format.html { render 'home/index' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :answer_id, :user_id)
    end
end
