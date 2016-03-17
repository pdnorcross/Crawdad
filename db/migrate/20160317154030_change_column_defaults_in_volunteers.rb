class ChangeColumnDefaultsInVolunteers < ActiveRecord::Migration
  def change
    change_column_default(:volunteers, :hours, 0.0)
    change_column_default(:volunteers, :hours_rounded, 0)
    change_column_default(:volunteers, :hours_month, 0)
  end
end
