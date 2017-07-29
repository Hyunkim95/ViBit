class AddPrizesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :prize, :string, default: "{\"prize1\":0,\"prize2\":0}"
  end
end
