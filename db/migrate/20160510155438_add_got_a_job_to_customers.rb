class AddGotAJobToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :got_a_job, :string
  end
end
