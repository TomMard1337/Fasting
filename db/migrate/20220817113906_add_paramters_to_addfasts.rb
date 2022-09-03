class AddParamtersToAddfasts < ActiveRecord::Migration[7.0]
  def change
    add_column :addfasts, :weight, :string
    add_column :addfasts, :activity_level, :string
    
  end
end
