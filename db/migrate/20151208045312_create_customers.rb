class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :last_4
      t.date :USDA_expdate
      t.string :fname
      t.string :lname
      t.string :MI
      t.date :date
      t.string :address
      t.string :race
      t.string :city
      t.string :sex
      t.string :county
      t.string :employer
      t.string :state
      t.string :zip
      t.string :phone_num
      t.date :DOB
      t.string :occupation
      t.integer :age
      t.string :last_grade
      t.float :salary
      t.float :salary_spouse
      t.float :salary_house
      t.float :child_support
      t.string :food_stamps
      t.float :WIC
      t.float :unemployment
      t.float :social
      t.float :ssi
      t.string :SSI_note
      t.string :other_inc
      t.string :other_note
      t.float :total_inc
      t.float :rent_mortgage
      t.float :electricity
      t.float :gas
      t.float :water
      t.float :medicine
      t.float :med_supplies
      t.float :other_exp
      t.float :total_exp

      t.timestamps null: false
    end
  end
end
