class CreateQuestionDetails < ActiveRecord::Migration
  def change
    create_table :question_details do |t|
      t.belongs_to :test, index: true
       t.string :question
       t.integer :question_number
        t.string :question_type
       t.string :option_1
       t.string :option_2
       t.string :option_3
      t.timestamps null: false
    end
  end
end
