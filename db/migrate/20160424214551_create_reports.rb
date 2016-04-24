class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :total_recipients
      t.integer :new_clients
      t.integer :total_seniors
      t.integer :total_adults
      t.integer :total_children
      t.integer :total_families
      t.integer :four
      t.integer :five
      t.integer :unemployed
      t.integer :volunteers
      t.integer :vol_hours

      t.timestamps null: false
    end
  end
end
