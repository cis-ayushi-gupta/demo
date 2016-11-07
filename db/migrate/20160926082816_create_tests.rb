class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
    	t.belongs_to :course, index: true
       t.string :name
       t.integer :number_of_questions
        t.string :status
       t.integer :time_for_test
      t.timestamps null: false
    end
  end
end
