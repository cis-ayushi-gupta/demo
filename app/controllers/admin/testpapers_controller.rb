class Admin::TestpapersController < Admin::ApplicationController
  before_filter :authenticate_admin!
  before_filter :set_course , only: [:new, :create]
  before_filter :set_test , only: [:save_questions, :create_questions,:active_paper, :view_test, :edit, :destroy]
  before_filter :set_question , only: [:update]
 
  layout 'admin' 
  
  def new
    @test = Test.new 
  end

  def create
    @test = @course.tests.new(test_params)
    if @test.save

    else
      render 'new'
    end
  end

  def create_questions
    @question_detail = QuestionDetail.new
  end

  def save_questions
    @question_detail = @test.question_details.new(question_detail_params)
    @question_detail.save
    @answer = @question_detail.answers.new(answer_params)
    @answer.save
    if @test.question_details.count < @test.number_of_questions
      redirect_to admin_questions_path
    else
      redirect_to admin_index_path
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_index_path
  end

  def select_question 

  end

  def edit
    @question_detail = @test.question_details
    a = params[:question_number][:question_number].to_i
    if a > @test.question_details.count
      @error_message = "Please enter valid question number"
      redirect_to  admin_select_question_path(params[:id], @error_message)
    else
      @question = @question_detail.where(question_number: a).first
    end
  end

  def update
    @question_detail.update(questions_detail_params)
    @answer = @question_detail.answers.first
    @answer.update(answer_params)
    redirect_to admin_index_path
  end

  def view_test
    @question_detail = @test.question_details
  end
   
  def active_paper
    debugger
    @test.update(status: 'active')
  end

private
  def test_params
    params.require(:test).permit(:name, :number_of_questions, :time_for_test)
  end

private
  def questions_detail_params
    params.require(:question_detail).permit(:question, :option_1, :option_2, :option_3)
  end

 private
  def answer_params
    params.require(:answers).permit(:correct_option => [])
  end

  private
  def question_detail_params
    params.require(:question).permit(:question, :question_number, :option_1, :option_2, :option_3, :question_type)
  end

  def set_course
  	@course = Course.find(params[:course_id])
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_question
    @question_detail = QuestionDetail.find(params[:question_id])
  end
end