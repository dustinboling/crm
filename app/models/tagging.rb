class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :contact
  # attr_accessible :title, :body
end
