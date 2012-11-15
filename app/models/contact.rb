class Contact < ActiveRecord::Base
  attr_accessible :address, :company, :customer_id, :email, :first_name, :im, :last_name, :phone, :referred_by, :title
end
