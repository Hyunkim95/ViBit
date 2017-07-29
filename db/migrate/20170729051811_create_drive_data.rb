class CreateDriveData < ActiveRecord::Migration[5.1]
  def change
    create_table :drive_data do |t|
      t.references :user, foreign_key: true
      t.text :stats, array: true, default: []
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :start_loc, array: true, default: []
      t.decimal :end_loc, array: true, default: []

      t.timestamps
    end
  end
end
