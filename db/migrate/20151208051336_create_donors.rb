class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :email
      t.string :name
      t.string :item_type
      t.float :qty

      t.timestamps null: false
    end
  end
end
