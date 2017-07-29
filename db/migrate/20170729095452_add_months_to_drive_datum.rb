class AddMonthsToDriveDatum < ActiveRecord::Migration[5.1]
  def change
    add_column :drive_data, :month, :string
  end
end
