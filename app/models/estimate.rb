class Estimate < ActiveRecord::Base
  attr_accessible :client_id, :date_issued, :discount, :estimate_number, :notes, :po_number, :terms, :items_attributes

  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true, :reject_if => lambda { |p| p[:name].blank? }


  def total_price
    total_price = 0
    items.each do |item|
      # calculate price
      total_price = total_price + item.line_price
    end
    return total_price
  end

end
