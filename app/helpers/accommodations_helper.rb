module AccommodationsHelper
  
  def empty_default(value)
    value.empty? ? "--" : value 
  end

  def number_of_beds
    (1..6).to_a  << "6+"
  end
 
  def areas
    ["North East Brisbane", "North West Brisbane", "South East Brisbane", "South West Brisbane", "Ipswich", "Australian Capital Territory", "Northern Territory", "New South Wales", "South Australia", "Tasmania", "Victoria", "Western Australia"]
  end
end
