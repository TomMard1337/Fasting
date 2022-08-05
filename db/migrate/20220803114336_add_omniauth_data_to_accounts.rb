class AddOmniauthDataToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :image, :string
    add_column :accounts, :provider, :string
    add_column :accounts, :uid, :string
  end
end
