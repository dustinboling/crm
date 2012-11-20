class Note < ActiveRecord::Base
  attr_accessible :content, :contact_id

  belongs_to :contact
  belongs_to :user

end
