class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.text :description
      t.text :pdf
      t.text :title

      t.timestamps
    end
    add_index :products, :category_id
  end
end
