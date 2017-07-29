class AddStatsToDriveData < ActiveRecord::Migration[5.1]
  def change
    add_column :drive_data, :stats, :json, array: true, default: []
  end
end
