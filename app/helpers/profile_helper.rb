module ProfileHelper

  def render_contact_type(phones)
    if phones.first.phone_type == "Work"
      image_tag("building.png")
    elsif phones.first.hpone_type == "Home"
      image_tag("home.png")
    else
      phones.first.phone_type
    end unless phones.first.nil?
  end

end
