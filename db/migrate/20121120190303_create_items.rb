class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :estimate_id
      t.text :description
      t.text :name
      t.integer :price
      t.integer :quantity
      t.integer :tax

      t.timestamps
    end
    add_index :items, :estimate_id
  end
end
