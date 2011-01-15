module AccommodationsHelper
  
  def empty_default(value)
    value.empty? ? "--" : value 
  end

   def states
      ['ACT','QLD','NSW','WA','TAS','NT','SA'].sort 
   end

  def suburbs
    ['Acacia Ridge', 'Albany Creek', 'Albion', 'Alderley', 'Algester', 'Annerle']
  end
   

   def num_beds
      (1..6).to_a  << "6+"
   end
  
end
