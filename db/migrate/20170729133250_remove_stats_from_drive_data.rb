class RemoveStatsFromDriveData < ActiveRecord::Migration[5.1]
  def change
    remove_column :drive_data, :stats, :string
  end
end
