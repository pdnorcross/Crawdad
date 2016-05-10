class AddValuesToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :spouse_age, :integer
    add_column :customers, :spouse_occupation, :string
    add_column :customers, :spouse_DOB, :date
    add_column :customers, :marriage, :string
    add_column :customers, :other_income, :float
  end
end
