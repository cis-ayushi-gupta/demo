class Test < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :number_of_questions, numericality: { only_integer: true }
	belongs_to :course
	has_many :question_details, dependent: :destroy
end
