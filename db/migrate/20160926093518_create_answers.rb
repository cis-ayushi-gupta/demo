class CreateAnswers < ActiveRecord::Migration
  def change
  	# drop_table :answers
    create_table :answers  do |t|
      t.belongs_to :question_detail
      t.text :correct_option
      t.timestamps null: false
    end
  end
end
