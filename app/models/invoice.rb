class Invoice < ActiveRecord::Base
  attr_accessible :client_id, :date_issued, :discount, :invoice_number, :notes, :po_number, :terms, :items_attributes

  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true, :reject_if => lambda { |p| p[:name].blank? }

  def self.create_from_estimate!(estimate_id)
    invoice_number = get_next_invoice_number
    estimate = Estimate.find(estimate_id)
    items = estimate.items

    invoice = Invoice.create!(client_id: estimate.client_id,
                              date_issued: estimate.date_issued,
                              discount: estimate.discount,
                              invoice_number: invoice_number,
                              po_number: estimate.po_number,
                              notes: estimate.notes,
                              terms: estimate.terms)

    items.each do |item|
      Item.create!(invoice_id: invoice.id,
                   description: item.description,
                   name: item.name,
                   price: item.price,
                   quantity: item.quantity,
                   tax: item.tax)
    end

    return invoice
  end

  def self.get_next_invoice_number
    if Invoice.last.nil?
      1
    else
      Invoice.last.invoice_number + 1
    end
  end

  def total_price
    total_price = 0
    items.each do |item|
      total_price = total_price + item.line_price
    end
    return total_price
  end

end
