class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.integer :customer
      t.integer :last_4
      t.string :fname
      t.string :lname
      t.string :food_stamp
      t.date :fs_date
      t.date :DOB
      t.integer :age
      t.string :relationship

      t.timestamps null: false
    end
  end
end
