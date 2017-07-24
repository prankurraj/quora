class UpvoteController < ApplicationController
	before_action :authenticate_user!
  def toggle
  		
		@question = Question.find(params[:question_id])
		upvoteq = UpvoteQ.where(user: current_user, question: @question).first
		if upvoteq
			upvoteq.destroy!
			@isupvote=false
				
		else
			UpvoteQ.create(user: current_user, question: @question)
			@isupvote=true
			
		end

		respond_to do |format|
			format.js{}
		end

  end





end
