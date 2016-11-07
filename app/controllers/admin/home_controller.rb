class Admin::HomeController < Admin::ApplicationController
  before_filter :authenticate_admin!
  layout 'admin' 
  def index
     @courses = Course.includes(:tests)
     @tests = Test.all
  end

  def show
     
  end
 
end
