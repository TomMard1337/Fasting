class CreateAddfasts < ActiveRecord::Migration[7.0]
  def change
    create_table :addfasts do |t|
      t.string :Name
      t.datetime :DateAndTime

      t.timestamps
    end
  end
end
