class Item < ActiveRecord::Base
  attr_accessible :description, :estimate_id, :name, :price, :quantity, :tax

  validates_presence_of :name

  belongs_to :estimate


  def line_price
    if tax == 0
      @actual_tax = 1
    else
      @actual_tax = tax / 100.to_f
    end
    price * quantity * @actual_tax
  end

end
