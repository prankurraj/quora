class HomeController < ApplicationController

  def index
  	@question = Question.new
  	@questionfeed=Question.all.order(created_at: :desc)
  	# @answer=Answer.new
  	@answerfeed=Answer.all.order(created_at: :desc)

  end


  
end
