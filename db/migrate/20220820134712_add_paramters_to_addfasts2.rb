class AddParamtersToAddfasts2 < ActiveRecord::Migration[7.0]
  def change
    add_column :addfasts, :height, :string
  end
end
