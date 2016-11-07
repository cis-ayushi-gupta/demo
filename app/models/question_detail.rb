class QuestionDetail < ActiveRecord::Base
	validates :question, :option_1, :option_2, presence: true
	belongs_to :test
	has_many :answers
	has_many :user_answers
	 def next
	    self.class.where("question_number > ? AND test_id =  ?", question_number, self.test_id).first
	  end

	  def previous
	    self.class.where("question_number < ? AND test_id = ?", question_number, self.test_id).last
	  end
	
end
