class CreateScoreDetails < ActiveRecord::Migration
  def change
    create_table :score_details, id: false do |t|
      t.integer :score
      t.belongs_to :test, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
