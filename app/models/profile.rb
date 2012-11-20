class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users
  has_many :products

  def self.generate_tag_list(user_id)
    user = User.find(user_id)

    tag_ary = []
    user.contacts.each do |c|
      tags = c.tags
      tags.each do |t|
        unless t.blank?
          tag_ary << t.name
        end
      end
    end
    tag_list = tag_ary.uniq.sort
  end

end
