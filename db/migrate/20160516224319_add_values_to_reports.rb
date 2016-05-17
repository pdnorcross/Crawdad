class AddValuesToReports < ActiveRecord::Migration
  def change
    add_column :reports, :new_seniors, :integer
    add_column :reports, :new_adults, :integer
    add_column :reports, :new_children, :integer
    add_column :reports, :new_families, :integer
  end
end
