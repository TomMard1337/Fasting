class AddParamtersToAddfasts1 < ActiveRecord::Migration[7.0]
  def change
    add_column :addfasts, :unit_conversion, :string
  end
end
