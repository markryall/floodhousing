module AccommodationsHelper
  
  def empty_default(value)
    value.empty? ? "--" : value 
  end

  def number_of_beds
    (1..6).to_a  << "7+"
  end
 
  def areas
    <<EOF.split("\n")
Brisbane Inner-City
Brisbane North-East
Brisbane North-West
Brisbane South-East
Brisbane South-West
Ipswich
Central Queensland
Central East Queensland
North Queensland
Sunshine Coast
South Queensland
Rest of Queensland
Northern NSW
Rest of NSW
Melbourne
Ballarat and surrounds, Victoria
Horsham and surrounds, Victoria
Wangaratta
Shepparton and surrounds
Victoria
Australian Capital Territory
Northern Territory
Western Australia
South Australia
Tasmania
EOF
  end
end



