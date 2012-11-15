class Contact < ActiveRecord::Base
  attr_accessible :address, :company, :customer_id, :email, :first_name, :im, :last_name, :phone, :referred_by, :title, :phones_attributes, :tag_list

  belongs_to :user
  has_many :notes
  has_many :phones
  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :phones, allow_destroy: true, :reject_if => lambda { |p| p[:phone_number].blank? }

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).contacts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end


