class AddLoginStatusToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :login_status, :boolean, default: true
  end
end
