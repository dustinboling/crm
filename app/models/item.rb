class Item < ActiveRecord::Base
  attr_accessible :description, :estimate_id, :name, :price, :quantity, :tax

  validates_presence_of :name

  belongs_to :estimate

end
