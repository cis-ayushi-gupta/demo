class UserAnswer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question_detail
	serialize :user_answer
end
