class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :location, null: false

      t.timestamps
    end

    add_index :addresses, :location, unique: true
  end
end
