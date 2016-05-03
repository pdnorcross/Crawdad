class AddCustomerIdToDependents < ActiveRecord::Migration
  def change
    add_column :dependents, :customer_id, :integer
  end
end
