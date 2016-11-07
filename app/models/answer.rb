class Answer < ActiveRecord::Base
	belongs_to :question_detail
	 serialize :correct_option
end
