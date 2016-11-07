class Admin::UsersController < ApplicationController
	before_filter :set_user , only: [:user_detail, :view_marks]
	 layout 'admin' 

	def user_name
		 @user = User.all
		
	end

	def user_detail
		
	end

	def view_marks
		@marks = @user.score_details
		
	end

	def set_user
    @user = User.find(params[:user_id])

  end
end
