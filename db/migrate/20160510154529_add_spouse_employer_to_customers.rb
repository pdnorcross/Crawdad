class AddSpouseEmployerToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :spouse_employer, :string
  end
end
