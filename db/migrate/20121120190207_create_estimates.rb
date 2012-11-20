class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.integer :client_id
      t.date :date_issued
      t.integer :discount
      t.integer :estimate_number
      t.text :notes
      t.text :po_number
      t.text :terms

      t.timestamps
    end
    add_index :estimates, :client_id
  end
end
