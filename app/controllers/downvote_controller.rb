class DownvoteController < ApplicationController
			before_action :authenticate_user!

	def toggleq
			@question = Question.find(params[:question_id])
			downvoteq = Downvoteq.where(user: current_user, question: @question).first
		if downvoteq
			downvoteq.destroy!
			@isdownvote=false
				
		else
			Downvoteq.create(user: current_user, question: @question)
			@isdownvote=true
			
		end

		respond_to do |format|
			format.js{}
		end

	end


end
