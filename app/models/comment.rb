class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  validates :content, presence: true

end
