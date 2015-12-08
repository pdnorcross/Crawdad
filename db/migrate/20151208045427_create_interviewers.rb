class CreateInterviewers < ActiveRecord::Migration
  def change
    create_table :interviewers do |t|
      t.string :fname
      t.string :lname
      t.string :MI
      t.integer :hours

      t.timestamps null: false
    end
  end
end
