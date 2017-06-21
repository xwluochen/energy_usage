class CreateCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :costs do |t|
      t.belongs_to :measurement, index: true, foreign_key: true
      t.belongs_to :address, index: true, foreign_key: true
      t.integer :year, limit: 4
      t.integer :month, limit: 2
      t.decimal :month_cost, :precision => 12, :scale => 2

      t.timestamps
    end

    add_index :costs, [:year, :month, :measurement_id, :address_id], unique: true, name: "idx_costs"
  end
end
