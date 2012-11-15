class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :contact
      t.references :user
      t.text :content

      t.timestamps
    end
    add_index :notes, :contact_id
    add_index :notes, :user_id
  end
end
