class AddUserIdToAddfasts < ActiveRecord::Migration[7.0]
  def change
    add_column :addfasts, :account_id, :integer
    add_index :addfasts, :account_id
  end
end
