class Note < ActiveRecord::Base
  attr_accessible :content

  belongs_to :contact
  belongs_to :user

end
