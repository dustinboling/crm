class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :contact
      t.text :number
      t.text :location

      t.timestamps
    end
    add_index :phones, :contact_id
  end
end
