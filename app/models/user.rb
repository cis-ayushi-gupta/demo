class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :score_details
    has_many :user_answers     

def calculate(question_array)
	$marks = 0
	for i in 1..(question_array.length)
		@question_id = question_array.find{ |h| h['question_number'] == i }['id']
		@answer = Answer.find_by_question_detail_id(@question_id)
		@correct_answer = @answer.correct_option
		@users_answer = self.user_answers.where(question_detail_id: @question_id).first
		@user_answer = @users_answer.user_answer
		
		if @correct_answer.length == @user_answer.length
			if @correct_answer == @user_answer
					$marks = $marks + 1
			end
		end

		if @correct_answer.length + 1 == @user_answer.length 
			 @user_answer.shift
			if @correct_answer == @user_answer
					$marks = $marks + 1
			end
		end
			
	end
	return $marks
		
	end
end