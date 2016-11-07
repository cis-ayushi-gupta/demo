class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
before_filter :configure_permitted_parameters, if: :devise_controller?
  def after_sign_out_path_for(resource_or_scope)
    $question_number = 1
    $marks = 0
      if resource_or_scope == :user
        new_user_session_path
  	  else
        new_admin_session_path
      end
  end

  protected
    def configure_permitted_parameters
      # Fields for sign up
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :sex, :address, :pincode, :country, :date_of_birth, :college, :city ,:email, :password, :password_confirmation) }
    end
end
