class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :origin_id
      t.integer :destination_id
			t.datetime :datetime

      t.timestamps null: false
    end
  end
end
