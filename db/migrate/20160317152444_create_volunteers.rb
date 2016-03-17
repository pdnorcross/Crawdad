class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.decimal :hours
      t.integer :hours_rounded
      t.integer :hours_month
      t.date :last_login

      t.timestamps null: false
    end
  end
end
