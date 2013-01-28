require 'spec_helper'

describe AccommodationSearchQuery do
  
  describe 'query' do
    it 'should find area like area in the query parameter' do
      accommodation = AccommodationSearchQuery.new(:area => 'Ipswich')
      accommodation.to_sql_conditions.should eql ['area like ?', "%Ipswich%"]
    end
    
    it 'should not use area in query when searching on all areas' do
      accommodation = AccommodationSearchQuery.new(:area => 'All')
      accommodation.to_sql_conditions.should eql [""]
    end
    
    it 'should find number of beds greater than the number of beds in the query parameter' do
      accommodation = AccommodationSearchQuery.new(:number_of_beds => '4')
      accommodation.to_sql_conditions.should eql ['number_of_beds >= ?', '4']
    end
    
    it 'should ignore any values that are empty' do
      accommodation = AccommodationSearchQuery.new(:number_of_beds => '', :area => '')
      accommodation.to_sql_conditions.should eql [""]
    end
    
    it 'should build a query for all params available' do
      accommodation = AccommodationSearchQuery.new(:number_of_beds => '2', :area => 'Ipswich')
      accommodation.to_sql_conditions.should eql ['area like ? and number_of_beds >= ?', "%Ipswich%", '2']
    end
    
    it 'should find on pets' do
      accommodation = AccommodationSearchQuery.new(:pets => 'yes')
      accommodation.to_sql_conditions.should eql ['takes_pets = ?', true]
    end
    
    it 'should find on children' do
      accommodation = AccommodationSearchQuery.new(:children => 'yes')
      accommodation.to_sql_conditions.should eql ['takes_children = ?', true]
    end
    
    it 'should find on smokers' do
      accommodation = AccommodationSearchQuery.new(:smokers => 'yes')
      accommodation.to_sql_conditions.should eql ['takes_smokers = ?', true]
    end
    
    it 'should find on available' do
      accommodation = AccommodationSearchQuery.new(:available => true)
      accommodation.to_sql_conditions.should eql ['available = ?', true]
    end
    
    it 'should find on enabled' do
      accommodation = AccommodationSearchQuery.new(:enabled => true)
      accommodation.to_sql_conditions.should eql ['enabled = ?', true]
    end
    
  end
  
end
