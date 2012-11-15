class Phone < ActiveRecord::Base
  attr_accessible :location, :number

  belongs_to :contact

  before_validation :strip_phone_number

  TYPES = ["Work", "Home", "Skype", "Other"]

  def self.first_number
    self.order('id ASC').first.phone_number unless self.first.nil?
  end

  def strip_phone_number
    phone_number.gsub!(/[^0-9]/, "")
  end

end
