module UsersHelper
	def is_first_checked(answers,value)
		answers.first.user_answer.include?(value)
	end
end
