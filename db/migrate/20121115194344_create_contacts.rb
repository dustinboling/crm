class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :address
      t.text :company
      t.integer :customer_id
      t.text :email
      t.text :first_name
      t.text :last_name
      t.text :im
      t.text :phone
      t.text :referred_by
      t.text :title

      t.timestamps
    end
  end
end
