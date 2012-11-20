class Estimate < ActiveRecord::Base
  attr_accessible :client_id, :date_issued, :discount, :estimate_number, :notes, :po_number, :terms

  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true, :reject_if => lambda { |p| p[:name].blank? }

end
