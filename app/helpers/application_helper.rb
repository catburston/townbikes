module ApplicationHelper
  def link_to_location(location)
    link_to "Location", location_path(location.id)
  end
end
