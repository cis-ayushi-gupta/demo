class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers  do |t|
 	t.belongs_to :question_detail
 	t.belongs_to :user
    t.text :user_answer
    t.timestamps null: false
    end
  end
end
