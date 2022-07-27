class AddNameToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :date_of_birth, :datetime
    add_column :accounts, :is_female, :boolean, default: false
  end
end
