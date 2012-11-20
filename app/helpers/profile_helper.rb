module ProfileHelper

  def render_contact_type(phones)
    if phones.first.location == "Work"
      image_tag("building.png")
    elsif phones.first.location == "Home"
      image_tag("home.png")
    else
      phones.first.location
    end unless phones.first.nil?
  end

end
