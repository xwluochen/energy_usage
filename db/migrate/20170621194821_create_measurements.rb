class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.string :usage, null: false

      t.timestamps
    end

    add_index :measurements, :usage, unique: true
  end
end