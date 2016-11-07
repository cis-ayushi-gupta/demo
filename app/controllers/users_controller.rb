class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_question , only: [:save_data_in_session]
	before_filter :set_test , only: [:give_test, :save_data_in_session, :calculate_marks, :instruction, :review]
	layout 'user'
	$question_number = 1
	$timer_value = 0
	def index

	end

	def calculate_marks
		current_user.calculate($question_array)
		@score_detail = ScoreDetail.new
		@score_detail.test_id = params[:test_id]
		@score_detail.user_id = current_user.id
		@score_detail.score = $marks
		@score_detail.save
		$question_number = 1
		$timer_value = 0
		

	end

	def instruction
		if ScoreDetail.exists?(user_id: current_user.id, test_id: @test.id) 
			render 'error'
		end
	end

	def error
		
	end

	def review
		@question_detail = @test.question_details

	end

	def save_data_in_session
		if $user_answer.blank?
			@user_answer = UserAnswer.new
			@user_answer. question_detail_id = params[:question_detail_id]
			@user_answer. user_id = current_user.id
			@user_answer.user_answer =  params[:answers][:user_answer]
			@user_answer.save
		
		else
			@id = $user_answer.find{ |h| h['question_detail_id'] == params[:question_detail_id].to_i }['id']
			@user_answer = UserAnswer.find(@id)
			@user_answer.update(answer_params)
			
		end
		if params[:previous] == 'Previous'
		 	$question = @question.previous
		 	
		elsif params[:next] == 'Next'
		 	$question = @question.next

		else
			redirect_to calculate_marks_path
			return
		end
		redirect_to give_test_path(params[:test_id])
		return
	end

	def give_test
		$question_array = @test.question_details
			if $question_number == 1
	 			@question_id =  $question_array.find{ |h| h['question_number'] == $question_number }['id']
	 			$question_number =$question_number + 1
 			else
 				@question_id =  $question_array.find{ |h| h['question_number'] == $question.question_number }['id']
			end
		@question = QuestionDetail.find(@question_id)
		$user_answer = @question.user_answers
		$user_answer = @question.user_answers.where(:user_id => current_user.id)
		$timer_value = $timer_value + 1
	end

	def set_question
    @question = QuestionDetail.find(params[:question_detail_id])
  end

	def set_test
 	 	@test = Test.find(params[:test_id])
	end
  
   private
  def answer_params
    params.require(:answers).permit(:user_answer => [])
  end

end
