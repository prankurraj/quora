class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :downvoteqs
  has_many :upvote_qs
  validates :content, presence: true




  def upvote_by user_id
  	UpvoteQ.where(question_id: id, user_id: user_id).length > 0
  end



  def upvote_string user_id
  	if upvote_by user_id
  		return "devote"
  	else
  		return "Upvote"
  	end

  end


end
