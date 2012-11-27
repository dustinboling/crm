class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.date :date_issued
      t.float :discount
      t.integer :invoice_number
      t.text :po_number
      t.text :notes
      t.text :terms

      t.timestamps
    end
  end
end
