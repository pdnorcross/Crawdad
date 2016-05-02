class AddZipSpouseToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :zip_spouse, :string
  end
end
