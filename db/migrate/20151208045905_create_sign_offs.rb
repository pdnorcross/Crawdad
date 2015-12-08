class CreateSignOffs < ActiveRecord::Migration
  def change
    create_table :sign_offs do |t|
      t.integer :last_4
      t.string :ifname
      t.string :ilname
      t.string :terms
      t.string :notes

      t.timestamps null: false
    end
  end
end
